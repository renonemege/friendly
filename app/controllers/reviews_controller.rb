class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if current_user
      if !current_user.bookings.find_by(friend_group_id: params[:friend_group_id]).nil?
        @booking = Booking.find_by(friend_group_id: params[:friend_group_id])
        @review.booking = @booking
        @friend_group = @booking.friend_group
        if @review.save
          redirect_to friend_group_path(@friend_group)
        else
          # render 'friend_groups/show'
          redirect_to friend_group_path(@friend_group)
        end
      end
      if current_user.bookings.find_by(friend_group_id: params[:friend_group_id]).nil?
        @friend_group = FriendGroup.find(params[:friend_group_id])

        # render 'friend_groups/show'
        redirect_to friend_group_path(@friend_group)
      end
    else
      @friend_group = FriendGroup.find(params[:friend_group_id])
      redirect_to new_user_registration_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
