class CreateFriendGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_groups do |t|
      t.string :price
      t.string :description
      t.string :title
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
