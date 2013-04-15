class Trip < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title

  has_many :trip_users
  has_many :users, through: :trip_users

end
