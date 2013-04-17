class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  has_many :items
  has_many :trip_users
  has_many :trips, through: :trip_users
  
  validates           :first_name, :presence => true, :format => { :with => /^[a-zA-Z\s]*$/ }
  validates           :last_name, :presence => true, :format => { :with => /^[a-zA-Z\s]*$/ }
  validates           :email, :presence => true, uniqueness: true
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates           :password, :presence => true, :on => :create
  validates_length_of :password, minimum: 4, allow_blank: true

end
