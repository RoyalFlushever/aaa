class ApplicationController < ActionController::Base

  protect_from_forgery

  protected
    def after_sign_in_path_for(resource)
      if resource.class == Room
        request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      else
        rooms_path
      end
    end
end
