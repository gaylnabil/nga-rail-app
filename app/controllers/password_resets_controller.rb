class PasswordResetsController < ApplicationController

  # GET /password_reset
  def new
  end
  # POST /password_reset
  def create
    user_reset = User.find_by(email: params[:email])

    if user_reset.present?
        # Send email
        # "reset" function created on the mailers/password_mailer.rb
        PasswordMailer.with(user: user_reset).reset.deliver_now

        redirect_to root_path, notice: "Email of the user #{user_reset.email}, we have sent a link to your inbox to reset your password"
    else
        flash.now[:alert] = "Email does not exist"
        render :new
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    # With keyword "rescue" catch an exception of expired token
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: "Your token has expired, please try again later"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)

      redirect_to login_path, notice: "Your password has been updated successfully"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
