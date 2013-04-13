class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :user

      t.timestamps
    end
    add_index :trips, :user_id
  end
end
