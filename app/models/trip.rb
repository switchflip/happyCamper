class Trip < ActiveRecord::Base
  attr_accessible :title, :description, :start_date, :end_date

  has_many :trip_users
  has_many :users, through: :trip_users

  validates :title, :presence => true
  validates :description, :presence => true
  validates :start_date, :date => {:before => :end_date}
  validates :end_date, :date => {:after => :start_date}


  def organizers
    self.users.where(:id => self.user_id)
  end

end
