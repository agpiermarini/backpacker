class ImagesController < ApplicationController
  def index
    @destination = Destination.find(params[:destination_id])
    @images = Image.all
  end

  def create
    DestinationImage.create!(destination_id: params[:destination_id], image_id: params[:image_id])
    redirect_to destinations_path
  end
end
