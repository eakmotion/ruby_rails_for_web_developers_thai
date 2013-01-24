class Match < ActiveRecord::Base
  attr_accessible :name, :sport_id, :time, :teams_attributes
  has_many :teams, :dependent => :destroy
  has_many :users, through: :teams
  accepts_nested_attributes_for :teams, :allow_destroy => true
  has_many :statuses, as: :postable
  belongs_to :sport
  #validate :check_player_uniqueness
  def check_player_uniqueness
    errors.add(:teams_attributes, "Players can't be repeated") unless user_ids.uniq == user_ids
  end

  def mark_losers
    teams.where("result != ?", 'win').update_all(result: 'lose')
  end

  def mark_tied
    teams.update_all(result: 'tie')
  end
end
