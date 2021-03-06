class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :planets
  has_many :reviews
  has_many :reservations
  has_many :user_reviews
  has_one_attached :photo
end
