class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:succes] = "Updated account information for #{@user.username}"
      redirect_to admin_users_path
    else
      flash.now[:error] = "Failed to update account information for user #{@user.username}"
      render :edit
    end
  end

  def destroy
    @users = User.all
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Deleted #{@user.username}"
      redirect_to admin_users_path
    else
      flash[:error] = "Failed to delete #{@user.username}"
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :role)
    end
end
