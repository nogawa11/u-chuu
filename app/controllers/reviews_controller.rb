class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    @user = User.find(params[:user_id])
    @planet = Planet.find(params[:planet_id])
    @review.user = @user
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
