class Condo < ActiveRecord::Base
  belongs_to :owner
  has_many :vacations
  has_many :guests, through: :vacations
end
