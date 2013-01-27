class DropUserFriendship < ActiveRecord::Migration
  def change
    drop_table :user_friendships
  end
end
