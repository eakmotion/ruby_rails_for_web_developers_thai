class Post < ActiveRecord::Base
	attr_accessible :content

	belongs_to :parent, polymorphic: true
	belongs_to :user

end
