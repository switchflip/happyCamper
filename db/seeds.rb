User.destroy_all
Item.destroy_all
Trip.destroy_all

user = User.create!(first_name: "John", last_name: "Smith", email: "john@smith.com", password: "test")

50.times do |i|
  item1 = user.items.create!(name: "Item #{i + 1}", quanity: (rand(4) + 1))
end

4.times do |i|
  item1 = user.trips.create!(title: "Trip #{i + 1}", description: "Funtrip #{i + 1}", start_date: 2013/6/6, end_date: 2013/6/12)
end
