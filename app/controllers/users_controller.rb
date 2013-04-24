class UsersController < ApplicationController

  before_filter :require_login, :except => [:new, :create, :invite]

  def new
    @signup_nav = true
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      UserMailer.welcome_email(@user).deliver
      redirect_to root_path, :notice =>"Account created!"
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

  def invite
    @user = User.where(:invite_token => params[:invite_token]).first
    if @user.nil?
      redirect_to new_user_path, :notice => "Invalid invite token."
    else
      # TODO: active user account (https://github.com/NoamB/sorcery - @user.activate!)
      auto_login(@user)
      redirect_to edit_user_path(@user), :notice => "Please complete account details."
    end
  end
end
