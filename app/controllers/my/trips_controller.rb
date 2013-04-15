class My::TripsController < ApplicationController
  
  before_filter :require_login

  def index
    @user = current_user
    @trips = current_user.trips.all
    #raise Trip.all.inspect
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = Trip.new params[:trip]
    @trip.users << current_user
    if @trip.save
      redirect_to my_trips_path, notice: "Trip created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update_attributes params[:trip]
      redirect_to my_trips_path, notice: "Trip successfully updated!"
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to my_trips_path, notice: "Trip deleted."
  end
end
