class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable

  has_many :user_oauthens
  has_many :oauthens ,:through=> :user_oauthens


  def self.find_for_google_oauth2(auth)
      user=User.find_or_create_by(:email=>auth['info']['email'])
      if user.name.nil?
         user.name=auth['info']['name']
         user.password=Devise.friendly_token[0,20]
         o=Oauthen.new
         o.token=auth.credentials.token
         o.refresh_token=auth.credentials.refresh_token
         o.save
         user.oauthen_ids=o.id
      else
      user.oauthens.token=auth.credentials.token
      user.oauthens.refresh_token=auth.credentials.token
    end
      user.save
      return user

end
end
