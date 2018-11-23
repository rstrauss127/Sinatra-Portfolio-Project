class Guest < ActiveRecord::Base
  has_many :vacations
end
