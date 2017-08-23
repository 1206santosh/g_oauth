class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,:omniauthable

  has_many :user_oauthens
  has_many :oauthens ,:through=> :user_oauthens


  def self.find_for_google_oauth2(auth)
    
end
end
