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
  end

  validates :image, presence: { message: "を選択してください" }

  def save(tag_list)
    stock = Stock.create(food_name: food_name, expiration_date: expiration_date, memo: memo, image: image, user_id: user_id)
    
    # 複数のタグを保存
    tag_list.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      StockTag.create(stock_id: stock.id, tag_id: tag.id)
    end
  end

  def update(params, stock, tag_list)
    #一度タグの紐付けを消す
    stock.stock_tags.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag_list.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      # タグを保存
      tag.save
      StockTag.create(stock_id: stock.id, tag_id: tag.id)
      stock.update(params)
    end
  end

end