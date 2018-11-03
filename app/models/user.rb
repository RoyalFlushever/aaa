class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :rooms

  # after_create :notify_admin

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = provider_data.info.first_name
      user.last_name = provider_data.info.last_name
      # user.skip_confirmation!
    end
  end

  def notify_admin
    # UserMailer.new_user(self).deliver if Rails.env.production?
    UserMailer.new_user(self).deliver_now!
  end
end
