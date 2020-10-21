class FriendGroupsController < ApplicationController
  def index
    @friend_groups = FriendGroup.all
  end

  def new
    @friend_group = FriendGroup.new
  end

  def create
    @friend_group = FriendGroup.new(friend_group_params)
    @user = current_user
    @friend_group.user_id = @user.id
    if @friend_group.save
      redirect_to friend_group_path(@friend_group)
    else
      render :new
    end
  end

  def show
    set_friend_group
    @booking = Booking.new
    @review = Review.new
    @user = current_user
  end

  def edit
    set_friend_group
  end

  def update
    set_friend_group
    if @friend_group.update(friend_group_params)
      redirect_to @friend_group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @friend_group = FriendGroup.find(params[:id])
    @bookings = Booking.where(friend_group_id: params[:id])
    @friend_group.destroy

    redirect_to friend_groups_path
  end

  private

  def set_friend_group
    @friend_group = FriendGroup.find(params[:id])
  end

  def friend_group_params
    params.require(:friend_group).permit(:price, :description, :title, :address)
  end
end
