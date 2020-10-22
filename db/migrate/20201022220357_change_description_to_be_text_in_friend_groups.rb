class ChangeDescriptionToBeTextInFriendGroups < ActiveRecord::Migration[6.0]
  def change
    change_column :friend_groups, :description, :text
  end
end
