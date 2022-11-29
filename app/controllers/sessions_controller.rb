class SessionsController < ApplicationController
  # GET /login
  def new

    if Current.user # Check if current user is already logged in
        redirect_to root_path
    end
  end

  # POST /login
  def create
    user = User.find_by(email: params[:email])
    if user.present? and user.authenticate(params[:password])
        # log_in_user is a function that exists in helpers/sessions_helper.rb which is included in the application_controller.rb (Global function)
        log_in_user(user)
        # session[:user_id] = current_user.id
        redirect_to root_path, notice: "You logged in"
    else
      flash.now[:alert] = "Login or password is Invalid"
      render :new
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out !!!"
  end

  # private
  #   # Only allow a list of trusted parameters through.
  #   def user_params
  #     params.require(:user).permit(:email, :password)
  #   end
end
