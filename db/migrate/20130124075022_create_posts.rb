class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id
      t.integer :match_id
      t.belongs_to :postable, polymorphic: true

      t.timestamps
    end
    add_index :posts, [:postable_id, :postable_type]
  end
end
