class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :omniauthable, omniauth_providers: [:google_oauth2]
  include AASM

  def update_from_google_identity(google_identity)
    self.update(
      first_name: google_identity.first_name,
      last_name: google_identity.last_name,
      email: google_identity.email,
      email_verified: google_identity.email_verified,
      avatar_url: google_identity.image
    )
    self.update(name: google_identity.name) if name.blank?
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
                         email: data['email'],
                         password: Devise.friendly_token[0,20]
      )
    end
    user.update_from_google_identity(data)
    user
  end
end
