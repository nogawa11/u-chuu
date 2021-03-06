class Owner::PlanetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @planets = policy_scope(Planet).where(user: current_user).order(name: :asc)
  end
end
