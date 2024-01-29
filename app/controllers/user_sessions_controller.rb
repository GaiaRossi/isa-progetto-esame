class UserSessionsController < ApplicationController
  # in application controller ho definito come
  # before action la richiesta di essere loggati
  # ma questo controller non deve richiedere tale controllo
  # se no come mi loggo?
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login success!"
      redirect_to projects_path
    else
      flash[:notice] = "Login failed!"
      redirect_to new_user_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end  
end
