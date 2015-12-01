 class ReviewsController < ApplicationController
 before_action :find_experience, only: [:new, :create, :index]
 before_action :authenticate_user!

  def index
    @reviews = @experience.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @experience.reviews.build(review_params)
    if @review.save
      flash[:notice] = "Your review was created."
      redirect_to experience_path(@experience.id)
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

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
  def find_experience
    @experience = Experience.find(params[:experience_id])
  end
end
