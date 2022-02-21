class CreatePlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :location
      t.integer :price_per_night
      t.integer :maximum_guests
      t.string :description
      t.integer :rotation_time
      t.integer :revolution_time
      t.integer :radius
      t.integer :avg_temp
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
