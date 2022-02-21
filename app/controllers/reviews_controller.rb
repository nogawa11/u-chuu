class ReviewsController < ApplicationController
  def new
    @planet = Planet.find(params[:planet_id])
    # @review = Review.new
    @review = current_user.reviews.new
    authorize @review
  end

  def create
    # @review = Review.new(review_params)
    @review = current_user.reviews.new(review_params)
    authorize @review
    # @user = current_user
    @planet = Planet.find(params[:planet_id])
    # @review.user = @user
    @review.planet = @planet

    if @review.save
      redirect_to planet_path(@planet)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :planet_id, :content, :rating)
  end
end
