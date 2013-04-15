class CreateTripUsers < ActiveRecord::Migration
  def change
    create_table :trip_users do |t|
      t.integer :user_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
