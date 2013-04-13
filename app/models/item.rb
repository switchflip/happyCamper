class Item < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :quanity
end
