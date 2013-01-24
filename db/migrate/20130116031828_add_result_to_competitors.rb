class AddResultToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :result, :string
  end
end
