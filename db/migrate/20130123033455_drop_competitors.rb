class DropCompetitors < ActiveRecord::Migration
  def change
    drop_table :competitors
  end
end
