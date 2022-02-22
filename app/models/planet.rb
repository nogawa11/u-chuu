class Planet < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true
  validates :maximum_guests, presence: true
end
