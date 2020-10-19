class FriendGroupsController < ApplicationController
  def index
    @friend_groups = FriendGroup.all
  end

  def new
    @friend_group = FriendGroup.new
  end

  def create

  end

  def show
    set_friend_group
    @review = Review.new


  end

  def edit
  end

  def update
  end

  def destroy
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
