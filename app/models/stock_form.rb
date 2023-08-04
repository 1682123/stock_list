class StockForm
  include ActiveModel::Model

  attr_accessor(
    :food_name, :expiration_date, :memo, :image,
    :id, :created_at, :updated_at,
    :tag_name, :user_id
  )
  
  with_options presence: true do
    validates :food_name
    validates :expiration_date
    validates :image
  end

  def save(tag_list)
    stock = Stock.create(food_name: food_name, expiration_date: expiration_date, memo: memo, image: image, user_id: user_id)
    
    # 複数のタグを保存
    tag_list.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      StockTag.create(stock_id: stock.id, tag_id: tag.id)
    end
  end

end