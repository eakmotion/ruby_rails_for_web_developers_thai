class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :result
      t.integer :match_id

      t.timestamps
    end
  end
end
