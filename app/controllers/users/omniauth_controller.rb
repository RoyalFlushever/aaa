class Users::OmniauthController < Devise::OmniauthCallbacksController
  # facebook callback
  def facebook
    # create a user from auth data
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    
    # user created successfully 
    if @user.persisted?
      # redirect to user
      sign_in_and_redirect @user
      # set flash success message ( devise controller method ) - refer devise.en.yml
      set_flash_message( :notice, :success, kind: 'Facebook') if is_navigational_format?
    
    # failed a new user creation  
    else
      flash[:error] = "There was a problem signing you through Facebook. Please try later."
      redirect_to new_user_registration_path
    end

  end

  # google callback
  def google
  end
end
