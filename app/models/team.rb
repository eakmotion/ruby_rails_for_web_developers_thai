class Team < ActiveRecord::Base
  attr_accessible :match_id, :name, :result,
                      :team_members_attributes

  DEFAULT_NAMES = ("A".."Z").to_a

  VALID_RESULTS = %w(win lose tie none)

  belongs_to :match
  has_many :team_members
  has_many :users, through: :team_members

  # validates :match, presence: true
  # validates :name, uniqueness: { scope: :match_id }
  # validates :result

  accepts_nested_attributes_for :team_members

  delegate :mark_losers, :mark_tied, to: :match


  after_update -> { mark_losers },
           if: -> { result_changed? and result == 'win' }

  after_update -> { mark_tied },
           if: -> { result_changed? and result == 'tie' }


  def generate_name(index)
    self.name = DEFAULT_NAMES[index]
  end

  def self.win_result
    where(:result => 'win')
  end

  def self.lose_result
    where(:result => 'lose')
  end

end
