class CreateCompetitors < ActiveRecord::Migration
  def change
    create_table :competitors do |t|
      t.integer :user_id
      t.integer :match_id

      t.timestamps
    end
  end
end
