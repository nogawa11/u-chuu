class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.boolean :status
      t.date :start_date
      t.date :end_date
      t.integer :number_of_guests
      t.references :planet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
