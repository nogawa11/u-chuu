class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :reservation
  validates :subject, presence: true
  validates :message, presence: true
end
