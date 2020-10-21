class AddCoordinatesToFriendGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :friend_groups, :latitude, :float
    add_column :friend_groups, :longitude, :float
  end
end
