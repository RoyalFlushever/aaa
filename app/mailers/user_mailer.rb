class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  default from: 'royalflushdiamond918@gmail.com'

  def new_user( user )
    @user = user
    mail( to: "unjomose@gmail.com", subject: "New User - #{@user.first_name} + #{@user.last_name}" )
  end
end
