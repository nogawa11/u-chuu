class Owner::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @approved_reservations = policy_scope(Reservation).where(reservation_status: 'approved').order(start_date: :asc)
    @pending_reservations = policy_scope(Reservation).where(reservation_status: 'pending').order(start_date: :asc)
    @declined_reservations = policy_scope(Reservation).where(reservation_status: 'declined').order(start_date: :asc)
  end
end
