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
      render :new
    end
  end

  def show
    @destination = Destination.find(params[:id])
    @images = @destination.images
  end

  def edit
    @destination = Destination.find(params[:id])
    @countries = Country.all
  end

  def update
    destination = Destination.find(params[:id])
    if destination.update(destination_params)
      flash[:success] = "Updated #{destination.title}"
      redirect_to destinations_path
    else
      flash[:error] = "Failed to update #{destination.title}"
      redirect_to edit_destination_path(destination)
    end
  end

  def destroy
    destination = Destination.find(params[:id])
    if destination.destroy
      flash[:success] = "Removed #{destination.title} from my destinations"
      redirect_to destinations_path
    else
      flash[:error] = "Failed to remove #{destination.title} from my destinations"
      redirect_to destination_path(destination)
    end
  end

  private
    def destination_params
      params.require(:destination).permit(:title, :notes, :country_id)
    end
end
