class AddReservationStatusToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_status, :integer
  end
end
