class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presences_of :password :on => :create
  validates_presences_of :email
  validates_uniqueness_of :email
end
