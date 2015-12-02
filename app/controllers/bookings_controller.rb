class BookingsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])

    @booking = current_user.bookings.build(experience: @experience)
    if @booking.save
      flash[:notice] = "Your booking was created."
      redirect_to root_path
    else
      flash[:notice] = "Oops something went wrong"
      render "show"
    end
    # it's the same as
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant
    # @review.save
  end



  def index
    @bookings = Booking.all
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)

  end
end
