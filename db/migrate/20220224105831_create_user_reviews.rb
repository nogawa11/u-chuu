class CreateUserReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :user_reviews do |t|
      t.integer :rating
      t.string :comment
      t.integer :type

      t.timestamps
    end
  end
end
