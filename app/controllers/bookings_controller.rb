class BookingsController < ApplicationController
  def index
    @booking = current_user.booking
  end

  def create
    @booking = Booking.new(booking_params)
    @friend_group = FriendGroup.find(params[:friend_group_id])
    @user = current_user

    if current_user
      @booking.friend_group = @friend_group
      @booking.user_id = @user.id
      if @booking.save
        redirect_to friend_group_path(@friend_group)
      else
        redirect_to friend_group_path(@friend_group)
      end
    else
      redirect_to new_user_registration_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price)
  end
end
