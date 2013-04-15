class Item < ActiveRecord::Base
  attr_accessible :name, :quanity

  belongs_to :user
end
