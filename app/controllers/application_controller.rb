
class ApplicationController < ActionController::Base
  protect_from_forgery
  #test for forum
  
    def after_sign_in_path_for(resource)
     stored_location_for(resource) || user_path(current_user)
   end


end
