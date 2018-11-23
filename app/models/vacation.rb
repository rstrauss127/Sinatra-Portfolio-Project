class Vacation < ActiveRecord::Base
  belongs_to :guest
  belongs_to :condo
end
