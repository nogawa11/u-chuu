class UserReview < ApplicationRecord
  belongs_to :user
  enum review_type: %i[host guest]
end
