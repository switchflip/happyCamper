require "spec_helper"

describe My::TripsController do

  before do
    @user = FactoryGirl.create(:user, first_name: "batman", password: "secret")
    session[:user_id] = @user.id
  end

  it "responds to GET properly" do
    get :index
    response.should be_success
    response.should render_template(:index)
  end

end