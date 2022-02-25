class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  before_action :set_planet, only: %i[new create]

  def index
    @reservations = policy_scope(Reservation).where(user: current_user).order(start_date: :asc)
  end

  def new
    @reservation = current_user.reservations.new
    authorize @reservation
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    authorize @reservation
    @reservation.planet = @planet
    @reservation.reservation_status = 'pending'
    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def show
    authorize @reservation
    @planet = @reservation.planet
    @reviews_avg = @planet.reviews.any? ? (@planet.reviews.average(:rating)).round(1) : 0
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params) && @reservation.user == current_user
      @reservation.reservation_status = 'pending'
      @reservation.save
      redirect_to reservations_path
    elsif @reservation.update(reservation_params) && @reservation.planet.user == current_user
      redirect_to owner_reservations_path
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

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def reservation_params
    params.require(:reservation).permit(:planet_id, :user_id, :status, :start_date, :end_date, :number_of_guests, :reservation_status)
  end
end
