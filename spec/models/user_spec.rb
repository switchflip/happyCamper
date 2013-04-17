require 'spec_helper'

describe User do
  # it "does not authenticate without firstname" do
  #   FactoryGirl.create()
  # end

  it "does not authenticate with incorrent password" do
    FactoryGirl.create(:user, first_name: "batman", password: "secret")
    User.authenticate("batman", "incorrect").should be_false
  end

  it "does not authenticate without first name" do
    FactoryGirl.create(:user, first_name: "Webmaster", password: "secret")
    User.authenticate("", "secret").should be_false
  end

  it "does not authenticate without last name" do
    FactoryGirl.create(:user, last_name: "Internet", password: "secret")
    User.authenticate("", "secret").should be_false
  end

  it "User does not authenticate with number as last name" do
    user = FactoryGirl.build(:user, last_name: "666", password: "secret")
    user.valid?.should be_false
  end
end