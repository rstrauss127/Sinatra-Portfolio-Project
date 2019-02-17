class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  has_many :posts
  has_many :messages
end
