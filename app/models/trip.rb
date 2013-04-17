class Trip < ActiveRecord::Base
  attr_accessible :title, :description, :end_date, :start_date

  has_many :trip_users
  has_many :users, through: :trip_users

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :date => {:before => :end_date}
  validates :end_date, :date => {:after => :start_date}
end
