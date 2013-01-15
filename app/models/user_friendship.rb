class UserFriendship < ActiveRecord::Base
  attr_accessible :friend_id, :user_id

  belongs_to :user
  belongs_to :friend, class_name: 'user' , foreign_key: 'friend_id'
  
end
