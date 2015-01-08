class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  validates :user, :content, presence: true
end
