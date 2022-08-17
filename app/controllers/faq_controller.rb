class FaqController < ApplicationController
  def index
    @faq_value = "This is the index page for FaqController Test"
    @user = User.find_by(email: params[:email]) # this is the user that will be logged in"
  end
end
