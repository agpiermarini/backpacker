class ImagesController < ApplicationController
  def index
    @destination = Destination.find(params[:destination_id])
    @images = Image.all
  end

  def create
    @destination = Destination.find(params[:destination_id])
    @images = Image.all
    destination_image = DestinationImage.new(destination_id: params[:destination_id], image_id: params[:image_id])
    if destination_image.save
      flash.now[:success] = "Added image \"#{destination_image.image.name}\" to #{@destination.title}"
    else
      flash.now[:error] = "The image \"#{destination_image.image.name}\" has already been added to #{@destination.title}"
    end
    render :index
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @images = @destination.images
    destination_image = DestinationImage.find_by(destination_id: params[:destination_id], image_id: params[:image_id])
    if destination_image.destroy
      flash[:success] = "Removed image \"#{destination_image.image.name}\" from this destination"
      redirect_to destination_path(@destination)
    else
      flash.now[:error] = "Removed image \"#{destination_image.image.name}\" from this destination"
      render "destinations/show"
    end
  end
end
