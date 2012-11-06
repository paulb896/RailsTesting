class UserAvailable < ActiveRecord::Base
  attr_accessible :end_time, :start_time, :status, :user_id
  belongs_to :user
end
