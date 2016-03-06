class User < ActiveRecord::Base
  attr_accessor
  validates :username, :presence => true, :uniqueness => true
  validates :email , :presence => true, :uniqueness => true
  validates :password, :confirmation => true

  has_many :posts
  has_many :comments
  
  def full_name
    fname + " " + lname
  end
end
