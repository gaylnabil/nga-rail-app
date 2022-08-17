class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_current_user # This function is called from SessionsHelper
end
