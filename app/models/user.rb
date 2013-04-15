class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  has_many :items
  has_many :trips
  has_many :trip_users through: :user_trips

  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true, uniqueness: true
  validates :password, :presence => true, :on => :create

end
