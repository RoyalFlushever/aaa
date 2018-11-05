module Users
  class SessionsController < Devise::SessionsController
    def new
      self.resource = resource_class.new(sign_in_params)
      puts "Session Controller #{params.inspect}"
      store_location_for(resource, params[:redirect_to])
      super
    end
  end
end