class AddOrganizerToTripUsers < ActiveRecord::Migration
  def change
    add_column :trip_users, :organizer, :boolean
  end
end
