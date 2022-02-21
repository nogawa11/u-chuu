class ReservationsController < ApplicationController
  def new
    @planet = Planet.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @planet = Planet.find(params[:id])
    @user = @planet.user
    @reservation = Reservation.new(reservation_params)
    @reservation.planet = @planet
    @reservation.user = @user

    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  def index
    @reservation = Reservation.all
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  def update
  end

  private

  def reservation_params
    params.require(:reservation).permit(:planet_id, :user_id, :status, :start_date, :end_date, :number_of_guests)
  end
end
