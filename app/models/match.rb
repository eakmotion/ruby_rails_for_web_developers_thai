class Match < ActiveRecord::Base
  attr_accessible :name, :sport_id, :time

  has_many :teams, dependent => :destroy
  accepts_nested_attributes_for :teams, :allow_destroy => true
  has_many :posts
  belongs_to :sport

end
