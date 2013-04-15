# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Item.destroy_all

user = User.create!(first_name: "John", last_name: "Smith", email: "john@smith.com", password: "test")

50.times do |i|
  item1 = user.items.create!(name: "Item #{i + 1}", quanity: (rand(4) + 1))
end