require "spec_helper"

describe Trip do

  it "should return an array or organizers" do
    user = FactoryGirl.create(:user, first_name: "trip", password: "organizer")
    trip = FactoryGirl.create(:trip)
    TripUser.create(:trip_id => trip.id, :user_id => user.id, :organizer => true)
    trip.organizers.count.should be(1)
  end

end