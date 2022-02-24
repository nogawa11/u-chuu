class AddUserToUserReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_reviews, :user, null: false, foreign_key: true
  end
end
