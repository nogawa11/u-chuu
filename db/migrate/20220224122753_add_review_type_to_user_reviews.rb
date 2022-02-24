class AddReviewTypeToUserReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :user_reviews, :review_type, :integer
  end
end
