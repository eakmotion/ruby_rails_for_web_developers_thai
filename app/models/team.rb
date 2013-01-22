class Team < ActiveRecord::Base
  attr_accessible :match_id, :name, :result, :team_members_attributes

  belongs_to :match
  has_many :team_members

  accepts_nested_attributes_for :team_members
end
