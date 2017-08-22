class Oauthen < ActiveRecord::Base
  has_many :user_oauthens
  has_many :users ,:through=> :user_oauthens
end
