class Tag < ApplicationRecord
  validates :tag_name, uniqueness: true

  has_many :stock_tags, dependent: :destroy
  has_many :stocks, through: :stock_tags

  def self.search_for_user(user, search)
    if search.present? && search != '#'
      tag = Tag.where(tag_name: search).first
      tag.stocks.where(user_id: user.id)
    else
      user.stocks
    end
  end
end
