class Tag < ApplicationRecord
  has_many :stock_tags, dependent: :destroy
  has_many :stocks, through: :stock_tags
end
