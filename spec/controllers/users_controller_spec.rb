require "spec_helper"

describe UsersController do

  def login
    @user = FactoryGirl.create(:user, first_name: "batman", password: "secret")
    session[:user_id] = @user.id
  end

  it "test new" do
    get :new
    response.should be_success
    response.should render_template(:new)
    assigns(:user).should_not be_nil
  end

  it "test create" do
    User.count.should equal(0)
    post :create, :user => {
      :first_name => 'John',
      :last_name  => 'Smith',
      :email      => 'john.smith@test.com',
      :password   => 'password'
    }
    User.count.should equal(1)
    session[:user_id].should_not be_nil
    ActionMailer::Base.deliveries.count.should equal(1)
    response.should redirect_to(root_path)
  end

  it "test show" do
    login()
    get :show, :id => @user.id
    response.should render_template(:show)
  end

  it "test invite" do
    @user = FactoryGirl.create(:user, :invite_token => "xxx")
    get :invite, :invite_token => "xxx"
    session[:user_id].should equal(@user.id)
    response.should redirect_to edit_user_path(@user)
    # response.should render_template(:index)
  end

  it "test failed invite" do
    get :invite, :invite_token => "wrong"
    response.should redirect_to new_user_path
  end

  it "test require_valid_user" do
    @user = User.new
    @user.save(:validate => false)
    @user.valid?.should be_false
    session[:user_id] = @user.id
    get :show, :id => @user.id
    response.should redirect_to edit_user_path(@user)
  end
end