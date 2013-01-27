class AddWinCounterCacheToUser < ActiveRecord::Migration
  def change
    add_column :users, :win_counter_cache, :integer, default: 0

    User.all.each do |u|
      u.win_counter_cache = u.teams.win_result.count
      u.save
    end
  end
end
