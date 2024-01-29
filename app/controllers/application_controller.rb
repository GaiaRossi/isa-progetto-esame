class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :signed_in?
    
    before_action :require_login
    
    def current_user
        @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end

    def signed_in?
        !current_user.nil?
    end

    private
        def require_login
            unless signed_in?
                flash[:error] = "You must be logged in to access this section!"
                redirect_to new_user_session_path
            end
        end
end
