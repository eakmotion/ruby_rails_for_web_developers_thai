class Post < ActiveRecord::Base
  attr_accessible :content, :match_id, :rating, :user_id
  belongs_to :postable, polymorphic: true
  belongs_to :user
  belongs_to :match
end
