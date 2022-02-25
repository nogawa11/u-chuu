class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_planet, only: %i[show edit update destroy]

  def index
    if params[:search].present?
      sql_query = " \
        name ILIKE :query \
        OR description ILIKE :query \
        OR location ILIKE :query \
      "
      @planets = policy_scope(Planet).where(sql_query, query: "%#{params[:search]}%").order(name: :asc)
    elsif params[:browse].present?
      search(params[:browse])
    else
      @planets = policy_scope(Planet).order(name: :asc)
    end
  end

  def show
    @reservation = Reservation.new
    @reviews_avg = @planet.reviews.any? ? (@planet.reviews.average(:rating)).round(1) : 0
    @review = Review.new
  end

  def new
    @planet = current_user.planets.new
    authorize @planet
  end

  def create
    @planet = current_user.planets.new(planet_params)
    authorize @planet
    if @planet.save
      redirect_to owner_planets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @planet.update(planet_params)
      redirect_to owner_planets_path
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
    authorize @planet
  end

  def planet_params
    params.require(:planet).permit(:user_id, :name, :description, :price_per_night, :maximum_guests, :rotation_time, :revolution_time, :radius, :avg_temp, :location, photos: [])
  end

  def search(params)
    case params
    when "hot"
      @planets = policy_scope(Planet).where("avg_temp > 100").order(name: :asc)
    when "jungle"
      @planets = policy_scope(Planet).where("description ILIKE ?", "%jungle%").order(name: :asc)
    when "cold"
      @planets = policy_scope(Planet).where("avg_temp < 0").order(name: :asc)
    when "dark"
      @planets = policy_scope(Planet).where("revolution_time > 500").order(name: :asc)
    end
  end
end
