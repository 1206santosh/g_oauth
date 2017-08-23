class CallbacksController < Devise::OmniauthCallbacksController

def google_oauth2

  #  User.find_for_google_oauth2(request.env["omniauth.auth"])
  a=Oauthen.new
  auth=request.env["omniauth.auth"]
  a.token=auth['credentials']['token']
  a.refresh_token=auth['credentials']['refresh_token']
  a.save
  current_user.oauthen_ids=a.id
  puts "=================================="
  puts "done"

  redirect_to root_path

end
end
