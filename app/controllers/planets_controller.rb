class PlanetsController < ApplicationController
  def show
    @planets = Planet.all
    @planet = Planet.find(params[:id])
    @reviews_avg = @planet.reviews.average(:rating)
  end

end
