class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_stock, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  
  def index
    # ログインユーザーの投稿のみの表示
    @user_stocks = current_user.stocks.order("expiration_date ASC")

    # 賞味期限までの残日数の表示
    @remaining_days = {}
    @user_stocks.each do |stock|
      if stock.expiration_date.present?
        remaining_days = (stock.expiration_date - Date.today).to_i
        @remaining_days[stock.id] = remaining_days
      end
    end
  end

  def new
    @stock_form = StockForm.new
  end

  def create
    @stock_form = StockForm.new(stock_form_params)

    # 複数のタグを,で区切って配列に保存
    tag_list = prepare_tags(params[:stock_form][:tag_name])
    
    if @stock_form.valid?
      @stock_form.save(tag_list)
      redirect_to stocks_path
    else
      render :new
    end
  end

  def edit
    stock_attributes = @stock.attributes
    @stock_form = StockForm.new(stock_attributes)

    #複数タグの表示
    @stock_form.tag_name = @stock.tags.pluck(:tag_name).join(',')
  end

  def update
    @stock_form = StockForm.new(stock_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @stock_form.image ||= @stock.image.blob

    # タグの複数保存
    tag_list = prepare_tags(params[:stock_form][:tag_name])

    if @stock_form.valid?
      @stock_form.update(stock_form_params, @stock, tag_list)
      redirect_to stocks_path
    else
      render :edit
    end
  end

  def destroy
    if @stock.destroy
      redirect_to stocks_path
    end
  end

  def search
    @user_stocks = current_user.stocks

    if (params[:keyword])[0] == '#'
      @user_stocks = Tag.search_for_user(current_user, params[:keyword]).order("expiration_date ASC")
    else
      @user_stocks = Stock.search_for_user(current_user, params[:keyword]).order("expiration_date ASC")
    end

    # 賞味期限までの残日数の表示
    @remaining_days = {}
    @user_stocks.each do |stock|
      if stock.expiration_date.present?
        remaining_days = (stock.expiration_date - Date.today).to_i
        @remaining_days[stock.id] = remaining_days
      end
    end
  end

  private
  def stock_form_params
    params.require(:stock_form).permit(:food_name, :expiration_date, :memo, :tag_name, :image).merge(user_id: current_user.id)
  end

  def prepare_tags(tags_string)
    tags = tags_string.split(",")
    formatted_tags = tags.map do |tag|
      tag.strip.start_with?("#") ? tag.strip : "##{tag.strip}"
    end
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @stock.user_id
      redirect_to action: :index
    end
  end
end
