class BookingsController < ApplicationController
  def index
    @bookings = Booking.joins(:friend_group).where(friend_groups: { user: current_user }, status: "available")
  end

  def create
    @booking = Booking.new(booking_params)
    @friend_group = FriendGroup.find(params[:friend_group_id])
    @user = current_user
    @review = Review.new
    @booking.friend_group = @friend_group
    @booking.user = @user
    if @booking.save
      redirect_to booking_path(@friend_group)
    else
      render 'friend_groups/show'
    end
  end

  def show
    @bookings = Booking.where(friend_group_id: params[:id])
    @booking = Booking.where(friend_group_id: params[:id]).last
    @friend_group = FriendGroup.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    flash[:alert] = "Booking succesfuly #{booking_params[:status]}"

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price)
  end
end
