class ReviewsController < ApplicationController
  before_action :set_planet, only: %i[new create]

  def new
    @review = current_user.reviews.new
    authorize @review
  end

  def create
    @review = current_user.reviews.new(review_params)
    authorize @review
    @review.planet = @planet
    respond_to do |format|
      if @review.save
        format.html { redirect_to planet_path(@planet) }
        format.json
      else
        format.html { render "planets/show" }
        format.json
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
    redirect_to planet_path(@review.planet)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :planet_id, :content, :rating)
  end

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end
end
