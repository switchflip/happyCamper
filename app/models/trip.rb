class Trip < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :end_date, :start_date, :title
end
