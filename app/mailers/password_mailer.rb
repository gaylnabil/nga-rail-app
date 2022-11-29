class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # This params[:user] are getting parameters from PasswordMailer.with(user: @user).reset.deliver_now
    user = params[:user]
    @name = params[:user].name
    @email = params[:user].email

    @token = user.signed_id(expires_in: 15.minutes, purpose: 'password_reset')

    @greeting = "Hi"

    mail to: @email

    puts "******************************************************************************"
    puts "D:/Projects/Ruby_Projects/nga_rails_app/app/mailers/password_mailer.rb"
    puts "line: 20"
    puts "Variable name: [ '@email' ] "
    puts "#{@email}"
    puts "******************************************************************************\n"

  end
end
