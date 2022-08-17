class HomeController < ApplicationController
  
  # GET to home page
  def index
    @control_value = "Welcome to the Home Controller and show it on home page html.erb"
    # @current_page = 'home'
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      # flash.now[:notice] = "Logged in successfully"
      # flash.now[:alert] = "Invalid username or password"
    end
    
  end
end
