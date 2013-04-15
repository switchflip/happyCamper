class TripUser < ActiveRecord::Base
  attr_accessible :trip_id, :user_id

  belongs_to :user
  belongs_to :trip
  
end
