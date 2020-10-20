class FriendGroupsController < ApplicationController
  def index
    @friend_groups = FriendGroup.all
  end

  def new
    @friend_group = FriendGroup.new
  end

  def create
    @friend_group = FriendGroup.new(friend_group_params)
    @user = User.first.id
    @friend_group.user_id = @user
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
    respond_to do |format|
      if @friend_group.update(friend_group_params)
        format.html { redirect_to @friend_group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend_group }
      else
        format.html { render :edit }
        format.json { render json: @friend_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_group = FriendGroup.find(params[:id])
    @bookings = Booking.where(friend_group_id: params[:id])
    # @bookings.destroy_all
    @friend_group.destroy


    redirect_to friend_groups_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_group
      @friend_group = FriendGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_group_params
      params.require(:friend_group).permit(:price, :description, :title, :address)
    end
end
