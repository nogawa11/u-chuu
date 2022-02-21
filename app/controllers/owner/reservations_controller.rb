class Owner::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @planets = policy_scope(Planet).where(user: current_user)
  end
end
