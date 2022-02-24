class RemoveTypeFromUserReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_reviews, :type, :integer
  end
end
