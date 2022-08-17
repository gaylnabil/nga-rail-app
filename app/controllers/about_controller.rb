class AboutController < ApplicationController

  # GET /about
  def index
    @about_value = "About us" # @about_value for sending data to about page template about/index.html.erb
  end

end
