class Relationship < ActiveRecord::Base
  attr_accessible :followed_id, :follower_id

  validates_uniqueness_of :follower_id, :scope => [:followed_id]  
  #validates :uniqueness, :follower_id, :scope =[:followed_id]

  #validates :uniqueness, [:follower_id, :followed_id]
  belongs_to :follower, :class_name => User
  belongs_to :followed, :class_name => User
end
