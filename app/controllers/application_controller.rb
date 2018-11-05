class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def after_sign_in_path_for(resource)
      if resource.class == Room
        request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      else
        rooms_path
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:terms])
    end

end
