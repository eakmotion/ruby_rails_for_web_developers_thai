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
  has_many :posts
  has_many :friends, through: :user_friendships
  mount_uploader :avatar , ImageUploader

end
