class TripUser < ActiveRecord::Base
  attr_accessible :trip_id, :user_id

  STATUS = [
    :invited   => 'Invited',
    :attending => 'Attending',
    :rejected  => 'Rejected'
  ]

  belongs_to :user
  belongs_to :trip

  
end
