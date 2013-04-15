class Trip < ActiveRecord::Base
  attr_accessible :title, :description, :end_date, :start_date

  has_many :trip_users
  has_many :users, through: :trip_users

end
