class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  has_many :posts
  has_many :study_sessions
  has_many :messages
end
