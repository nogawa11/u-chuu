class DropTableNotifications < ActiveRecord::Migration[6.1]
  def change
    drop_table :notifications do |t|
      t.string :subject, null: false
      t.string :message, null: false
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
