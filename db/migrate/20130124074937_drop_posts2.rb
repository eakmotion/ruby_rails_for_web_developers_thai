class DropPosts2 < ActiveRecord::Migration
  def change
    drop_table :posts
  end
end
