class UserReviewsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @reviewee = current_user
    @user_review = UserReview.new
    authorize @user_review
  end

  def create
    @user_review = UserReview.new(user_review_params)
    authorize @user_review
    @user_review.user = @user
    if @user_review.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def user_review_params
    params.require(:user_review).permit(:comment, :rating, :user_id, :review_type)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
