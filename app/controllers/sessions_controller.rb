class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:failure] = "Incorrect username and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
