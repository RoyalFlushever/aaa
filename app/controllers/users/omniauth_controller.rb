class Users::OmniauthController < Devise::OmniauthCallbacksController
  # facebook callback
  def facebook
    oauthrize "Facebook"
  end

  # google callback
  def google_oauth2
    oauthrize "Google"
  end

  def oauthrize(kind)
    # create a user from auth data
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    
    # user created successfully
    if @user.persisted?
      # redirect to user
      sign_in_and_redirect @user
      # set flash success message ( devise controller method ) - refer devise.en.yml
      set_flash_message( :notice, :success, kind: kind) if is_navigational_format?
    
    # failed a new user creation
    else
      flash[:error] = "There was a problem signing you through #{kind}. Please try later."
      redirect_to new_user_registration_path
    end

  end

  # callback failure
  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
    redirect_to new_user_registration_url
  end
  
end
