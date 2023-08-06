class StocksController < ApplicationController
  
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
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def stock_form_params
    params.require(:stock_form).permit(:food_name, :expiration_date, :memo, :tag_name, :image).merge(user_id: current_user.id)
  end
end
