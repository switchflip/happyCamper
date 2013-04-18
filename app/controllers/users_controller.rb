class UsersController < ApplicationController
  def new
    @signup_nav = true
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      UserMailer.welcome_email(@user).deliver
      redirect_to user_path, :notice =>"Account created!"
    else
      render :new
    end
  end

  def show
    @home_nav = true    
  end

  def edit
    @edit_nav = true
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_path, :notice => "Account succesfully updated."
    else
      render :edit
    end
  end

end
