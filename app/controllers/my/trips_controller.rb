class My::TripsController < ApplicationController
  
  before_filter :require_login

  def index
    @trips = current_user.trips.order('trips.created_at DESC').all
  end

  def new
    @trip = current_user.trips.build
  end

  def create
    @trip = current_user.trips.build params[:trip]
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
