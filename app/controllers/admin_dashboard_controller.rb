class AdminDashboardController < ApplicationController
  before_action :require_admin
  def index
    @projects = Project.all
    @users = User.all
    @tasks = Task.all
  end
end
