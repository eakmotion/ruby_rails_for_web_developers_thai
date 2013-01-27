class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username ,:email, :password, :password_confirmation, :remember_me, :avatar
  # attr_accessible :title, :body

  has_many :team_members
  has_many :teams , through: :team_members
 # has_many :posts
  has_many :statuses
  has_many :reviews

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name: "Relationship",
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # has_many :wins, :class_name => Team , :finder_sql => proc {
  #   %Q(
  #     SELECT *
  #     FROM teams t
  #     INNER JOIN team_members tm ON t.id = tm.team_id
  #     WHERE tm.user_id = #{id} and t.result = 'win'
  #     )
  #   }

  # has_many :loses, :class_name => Team , :finder_sql => proc {
  #   %Q(
  #     SELECT *
  #     FROM teams t
  #     INNER JOIN team_members tm ON t.id = tm.team_id
  #     WHERE tm.user_id = #{id} and t.result = 'lose'
  #     )
  #   }

  after_create :signup_confirmation

  mount_uploader :avatar , AvatarUploader

  def self.other_than(user)
    where("id != ?", user.id)
  end

  def signup_confirmation
    UserMailer.signup_confirmation(@user).deliver
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

end
