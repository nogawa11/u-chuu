class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def new
    @planet = Planet.find(params[:planet_id])
    @reservation = Reservation.new
  end

  def create
    @planet = Planet.find(params[:planet_id])
    @user = current_user
    @reservation = Reservation.new(reservation_params)
    @reservation.planet = @planet
    @reservation.user = @user
    @reservation.status = false
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render :new
    end
  end

  def index
    @reservations = Reservation.all
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  def show
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

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:planet_id, :user_id, :status, :start_date, :end_date, :number_of_guests)
  end
end
