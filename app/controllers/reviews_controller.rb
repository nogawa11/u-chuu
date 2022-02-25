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

    respond_to do |format|
      if @review.save
        format.html { redirect_to planet_path(@planet) }
        format.json # normal Rails flow, which is to render a views/reviews/create.json.jbuilder
      else
        format.html { render "planets/show" }
        format.json
      end
    end

    # if @review.save
    #   redirect_to planet_path(@planet)
    # else
    #   render :new
    # end
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
end
