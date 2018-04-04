class DestinationsController < ApplicationController
  def index
    @destinations = current_user.destinations
  end

  def new
    @destination = Destination.new
    @countries = Country.all
  end

  def create
    user = current_user
    destination = current_user.destinations.new(destination_params)
    if destination.save
      flash[:success] = "Added #{destination.title} to your destinations"
      redirect_to destinations_path
    else
      flash[:error] = "Failed to add #{destination.title} to your destinations"
      redirect_to new_destination_path
    end
  end

  private
    def destination_params
      params.require(:destination).permit(:title, :notes, :country_id)
    end
end
