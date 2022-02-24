class UserReview < ApplicationRecord
  belongs_to :user
  enum review_type: [:host, :guest]
end
