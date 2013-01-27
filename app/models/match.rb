class Match < ActiveRecord::Base
  attr_accessible :name, :sport_id, :time, :teams_attributes
  has_many :teams, :dependent => :destroy
  has_many :users, through: :teams
  accepts_nested_attributes_for :teams, :allow_destroy => true
  has_many :statuses, as: :postable
  has_many :reviews, as: :postable
  belongs_to :sport
  #validate :check_player_uniqueness
  def check_player_uniqueness
    errors.add(:teams_attributes, "Players can't be repeated") unless user_ids.uniq == user_ids
  end

  def mark_losers
    teams.where("result != ?", 'win').update_all(result: 'lose')
    winner_team = self.teams.where(result: "win").first
    winner_team.users.each do |u|
      u.update_attribute(:win_counter_cache, u.win_counter_cache + 1)
    end
  end

  def mark_tied
    teams.update_all(result: 'tie')
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end
end
