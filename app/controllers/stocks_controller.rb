class StocksController < ApplicationController
  before_action :set_stock, only: [:edit, :update]
  
  def index
    @stocks = Stock.includes(:user).order("expiration_date ASC")

    # 賞味期限までの残日数の表示
    @remaining_days = {}
    @stocks.each do |stock|
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
    tag_list = params[:stock_form][:tag_name].split(",")
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
    tag_list = params[:stock_form][:tag_name].split(",")

    if @stock_form.valid?
      @stock_form.update(stock_form_params, @stock, tag_list)
      redirect_to stocks_path
    else
      render :edit
    end
  end

  def destroy
    stock = Stock.find(params[:id])
    if stock.destroy
      redirect_to stocks_path
    end
  end

  private
  def stock_form_params
    params.require(:stock_form).permit(:food_name, :expiration_date, :memo, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
