class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :convert_format
    
    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end


end
