class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login success!"
      redirect_to user_sessions_new_path
    else
      flash[:notice] = "Login failed!"
      redirect_to user_sessions_new_path
    end
  end
end
