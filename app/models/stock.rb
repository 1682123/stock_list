class Stock < ApplicationRecord
  validates :food_name, presence: true
  validates :expiration_date, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :stock_tags, dependent: :destroy
  has_many :tags, through: :stock_tags
  has_one_attached :image
end
