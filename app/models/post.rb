class Post < ActiveRecord::Base
    belongs_to :user
    has_one :study_session
end
