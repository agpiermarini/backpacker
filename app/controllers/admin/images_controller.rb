class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Added image to the database"
      redirect_to admin_images_path
    else
      flash[:error] = "Failed to add image to the database"
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])
    if image.update(image_params)
      flash[:success] = "Updated #{image.name}"
      redirect_to admin_images_path
    else
      flash[:error] = "Failed to update #{image.name}"
      redirect_to edit_admin_image_path(image)
    end
  end

  def destroy
    image = Image.find(params[:id])
    if image.destroy
      flash[:success] = "Deleted #{image.name}"
    else
      flash[:error] = "Failed to delete #{image.name}"
    end
    redirect_to admin_images_path
  end

  private
    def image_params
      params.require(:image).permit(:name, :url)
    end
end
