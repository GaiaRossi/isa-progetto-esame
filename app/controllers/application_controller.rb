class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :signed_in?
    helper_method :require_admin
    
    before_action :require_login
    
    def current_user
        @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end

    def signed_in?
        !current_user.nil?
    end

    def require_admin
        unless current_user.is_admin?
          flash[:error] = "You must be admin in to access this section!"
          redirect_to projects_path
        end
    end

    private
        def require_login
            unless signed_in?
                flash[:error] = "You must be logged in to access this section!"
                redirect_to new_user_session_path
            end
        end
end
