class UsersController < ApplicationController
  def show
    @user = policy_scope(User).find_by_id(params[:id])
    authorize @user
    @as_host_reviews = @user.user_reviews.where(review_type: 0)
    @as_guest_reviews = @user.user_reviews.where(review_type: 1)
    @user_review = UserReview.new

    if @as_host_reviews.first.present?
      host_sum = []
      @as_host_reviews.each do |host_review|
        host_sum << host_review.rating
      end
      @host_rating = (host_sum.sum / host_sum.count).to_f.round(1)
    end
    if @as_guest_reviews.first.present?
      guest_sum = []
      @as_guest_reviews.each do |guest_review|
        guest_sum << guest_review.rating
        @guest_rating = (guest_sum.sum / guest_sum.count).to_f.round(1)
      end
    end
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:photo, :name)
  end
end
