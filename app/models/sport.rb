class Sport < ActiveRecord::Base
  attr_accessible :content, :name

  has_many :matches

end
