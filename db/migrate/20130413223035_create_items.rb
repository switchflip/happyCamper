class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quanity
      t.references :user

      t.timestamps
    end
    add_index :items, :user_id
  end
end
