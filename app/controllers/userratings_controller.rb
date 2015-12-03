class UserratingsController < ApplicationController
 before_action :find_user, only: [:new, :create, :index]
 before_action :authenticate_user!

  def index
    @userratings = @user.userratings
  end

  def new
    @userrating = Userrating.new
  end

  def create
    @userrating = @user.userratings.build(userrating_params)
    if @userrating.save
      flash[:notice] = "Your comment is posted."
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end
    # it's the same as
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant
    # @review.save
  end

  private

  def userrating_params
    params.require(:userrating).permit(:comment)
  end
  def find_user
    @user = User.find(params[:user_id])
  end
end


