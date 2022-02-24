class Owner::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = policy_scope(Reservation).where(planet: current_user.planets)
    if @reservations.first.present?
      @approved_reservations = @reservations.where(reservation_status: 'approved').order(start_date: :asc)
      @pending_reservations = @reservations.where(reservation_status: 'pending').order(start_date: :asc)
      @declined_reservations = @reservations.where(reservation_status: 'declined').order(start_date: :asc)
    end
  end
end
