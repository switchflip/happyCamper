class My::TripsController < ApplicationController  
  before_filter :require_login

  def index
    @user = current_user
    @trips = current_user.trips.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = Trip.new params[:trip]
    @trip.users << current_user
    @trip.user_id = current_user.id
    if @trip.save
      redirect_to my_trips_path, notice: "Trip created!"
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      redirect_to my_trips_path, notice: "Trip successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to my_trips_path, notice: "Trip deleted."
  end

  # post
  def invite
    @user = User.find_by_email(params[:email])
    if @user.nil?
      # validate email - look for an email validation gem
      @user = User.new(:email => params[:email])
      @user.save(:validate => false)
    end

    @user = 

  end
end
