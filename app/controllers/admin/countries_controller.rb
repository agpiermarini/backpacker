class Admin::CountriesController < Admin::BaseController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      flash[:success] = "Added #{@country.name} to the countries database"
      redirect_to admin_countries_path
    else
      flash[:error] = "Failed to add #{@country.name} to the countries database"
      render :new
    end
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    country = Country.find(params[:id])
    if country.update(country_params)
      flash[:success] = "Updated country name"
      redirect_to admin_countries_path
    else
      flash[:error] = "Failed to update country name"
      redirect_to edit_admin_country_path(country)
    end
  end

  def destroy
    country = Country.find(params[:id])
    if country.destroy
      flash[:success] = "#{country.name} removed from the database"
    else
      flash[:error] = "Failed to remove #{country.name} from the database"
    end
    redirect_to admin_countries_path
  end

  private
    def country_params
      params.require(:country).permit(:name)
    end
end
