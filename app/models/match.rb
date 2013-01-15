class Match < ActiveRecord::Base
  attr_accessible :name, :sport_id, :time

  has_many :competitors
  has_many :posts
  belongs_to :sport

end
