class Item < ActiveRecord::Base
  attr_accessible :name, :quanity

  belongs_to :user

  validates :name, :presence => true
  validates :quanity, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }
end
