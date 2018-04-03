class Admin::CountriesController < Admin::BaseController
  def new
    @country = Country.new
  end

  def create
    country = Country.new(name: params[:country])
    if country.save
      flash[:success] = "Added #{country.name} to the list of countries"
      redirect_to admin_countries_path
    else
      flash[:error] = "Failed to add country"
      redirect_to new_admin_country_path
    end
  end

  def index
  end
end
