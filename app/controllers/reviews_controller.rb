class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:friend_group_id])
    @review.booking = @booking
    @friend_group = @booking.friend_group

    if @review.save
      redirect_to friend_group_path(@friend_group)
    else
      render 'friend_group/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
