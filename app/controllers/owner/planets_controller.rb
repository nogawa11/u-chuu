class Owner::PlanetsController < ApplicationController

  def index
    @planets = current_user.planets
  end
end
