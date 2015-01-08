class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :posts, :dependent => :destroy

  has_many :relationships, :foreign_key => 'follower_id', :dependent => :destroy
  
  has_many :followeds, :through => :relationships

  has_many :reverse_relationships, :class_name => Relationship, :foreign_key => 'followed_id', :dependent => :destroy

  has_many :followers, :through => :reverse_relationships

#--------------------------------------------------------#

# Follows a user.
  def follow(other_user)
    #debugger
    relationships.create(:followed_id => other_user.to_i)
    #debugger
  end

  # Unfollows a user.
  def unfollow(other_user)
    #debugger
    relationships.find_by_followed_id(other_user.to_i).destroy
    #debugger
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
