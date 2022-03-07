class Product < ApplicationRecord
  has_many_attached :images
  belongs_to :category
  has_many :product_ratings
  has_many :users, through: :product_ratings
end
