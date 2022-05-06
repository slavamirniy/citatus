class ApplicationController < ActionController::Base
    include SessionHelper

    private

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Войдите, пожалуйста"
        redirect_to login_url
      end
    end
end
