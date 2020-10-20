class DashboardsController < ApplicationController
  def show
    @bookings = Booking.where(user_id: current_user.id)
    @friend_groups = FriendGroup.where(user_id: current_user.id)
  end
end
