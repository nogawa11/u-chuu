class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = policy_scope(Reservation).where(user: current_user)
  end

  def new
    @planet = Planet.find(params[:planet_id])
    # @reservation = Restaurant.new
    @reservation = current_user.reservations.new
    authorize @reservation
  end

  def create
    @planet = Planet.find(params[:planet_id])
    # @user = current_user
    # @reservation = Reservation.new(reservation_params)
    @reservation = current_user.reservations.new(reservation_params)
    authorize @reservation
    @reservation.planet = @planet
    # @reservation.user = @user
    @reservation.status = false
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def reservation_params
    params.require(:reservation).permit(:planet_id, :user_id, :status, :start_date, :end_date, :number_of_guests)
  end
end
