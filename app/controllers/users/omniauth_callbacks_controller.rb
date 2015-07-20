# class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#   protect_from_forgery except: :coinbase

#   def coinbase
#     p "it goes to here"
#     @user = User.find_for_oauth(request.env["omniauth.auth"])

#     @user.credentials.with_lock do
#       @user.credentials.credentials = request.env["omniauth.auth"]["credentials"]
#       @user.credentials.save
#     end

#     if @user.persisted?
#       sign_in_and_redirect @user, :event => :authentication
#     else
#       session["devise.omniauth_data"] = request.env["omniauth.auth"]
#     end
#   end

#   def failure
#     # unless current_user.coinbase_user_id
#       p "*" * 30
#       p "it fails"
#       p response = HTTParty.post("https://api.sandbox.coinbase.com/oauth/token?grant_type=authorization_code&code=#{params[:code]}&redirect_uri=http://localhost:3000/users/auth/coinbase/callback&client_id=#{ENV['COINBASE_CLIENT_ID']}&client_secret=#{ENV['COINBASE_CLIENT_SECRET']}")
#       current_user.coinbase_access_token = response["access_token"]
#       current_user.save

#       p response = HTTParty.get("https://api.sandbox.coinbase.com/v2/user", headers: {"Authorization" => "Bearer #{current_user.coinbase_access_token}" })
#       current_user.coinbase_user_id = response["data"]["id"]
#       current_user.save
#       redirect_to root_path
#     # end
#   end

# end