class Admin::ImagesController < Admin::BaseController
  def new
    @image = Image.new
  end

  def create
    image = Image.new(image_params)
    if image.save
      flash[:success] = "Added image to the database"
      redirect_to admin_images_path
    else
      flash[:error] = "Failed to add image to the database"
      redirect_to new_admin_image_path
    end
  end

  def index
  end

  private
    def image_params
      params.require(:image).permit(:name, :url)
    end
end
