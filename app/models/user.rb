class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  has_one_attached :avatar
  has_many :product_ratings
  has_many :products, through: :product_ratings
end
