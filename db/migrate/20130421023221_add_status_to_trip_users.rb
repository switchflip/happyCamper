class AddStatusToTripUsers < ActiveRecord::Migration
  def change
    add_column :trip_users, :status, :string
  end
end
