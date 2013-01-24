class ChangeDefaultForTeamsResult < ActiveRecord::Migration
  def change
    change_column :teams, :result, :string, default: ''
  end
end
