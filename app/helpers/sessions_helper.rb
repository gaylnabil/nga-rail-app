module SessionsHelper

    # Logs in the given user.
    def log_in_user(user)
        session[:user_id] = user.id
        Current.user = user
    end

    # Returns the current logged-in user (if any).
    def set_current_user
        Current.user ||= User.find_by(id: session[:user_id])
    end

    def require_user_logged_in!
        redirect_to login_path, alert: "You must be logged in to do that." if Current.user.nil?
    end
    
end
