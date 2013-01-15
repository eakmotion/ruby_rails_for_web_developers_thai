class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :parent_id
      t.string :parent_type
      t.text :content
      t.integer :user_id
      t.integer :match_id

      t.timestamps
    end
  end
end
