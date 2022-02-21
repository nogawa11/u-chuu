class PlanetsController < ApplicationController

  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    @planets = Planet.all
  end

  def show
    @planets = Planet.all
    @planet = Planet.find(params[:id])
    @reviews_avg = @planet.reviews.average(:rating)
  end

  def new
    @planet = Planet.new
    @user = current_user
  end

  def create
    @planet = Planet.new(planet_params)
    @user = current_user
    @planet.user = @user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      render :edit
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_path
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:user_id, :name, :description, :price_per_night, :maximum_guests, :rotation_time, :revolution_time, :radius, :avg_temp, photos: [])
  end

end
