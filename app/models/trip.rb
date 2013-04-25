class Trip < ActiveRecord::Base
  attr_accessible :title, :description, :start_date, :end_date, :location, :longitude, :latitude
  
  geocoded_by :location
  after_validation :geocode

  has_many :trip_users
  has_many :users, through: :trip_users

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :date => {:before => :end_date}
  validates :end_date, :date => {:after => :start_date}
  validates :location, :presence => true
  validates_format_of :location, :with => /^([a-z]|[A-Z])/
  

  def organizers
    # Returns the ids of all users who are organizers for this trip
    organizer_ids = self.trip_users.where(:organizer => true).pluck(:user_id)
    # Returns the users who have the ids
    User.where(:id => organizer_ids)
  end

end