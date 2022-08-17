class HomeController < ApplicationController

  # GET to home page
  def index
    @control_value = "Welcome to the Home Controller and show it on home page html.erb" # @control_value show this value on the home page home/html.erb
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      # flash.now[:notice] = "Logged in successfully"
      # flash.now[:alert] = "Invalid username or password"
    end

<<<<<<< HEAD
  end
end
=======

>>>>>>> 598ff4451dd6c086fc2a4d3b8a030174f04b4c2c
