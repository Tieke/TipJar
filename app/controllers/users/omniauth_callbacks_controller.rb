class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  protect_from_forgery except: :coinbase

  def coinbase
    p "it goes to here"
    @user = User.find_for_oauth(request.env["omniauth.auth"])

    @user.credentials.with_lock do
      @user.credentials.credentials = request.env["omniauth.auth"]["credentials"]
      @user.credentials.save
    end

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.omniauth_data"] = request.env["omniauth.auth"]
    end
  end

  # def passthru
  #   p "*" * 30
  #   p response = HTTParty.post("https://api.sandbox.coinbase.com/oauth/token?
  #   grant_type=authorization_code&
  #   code=#{params[:code]}&
  #   redirect_uri=http://localhost:3000/users/auth/coinbase/callback&
  #   client_id=#{ENV['COINBASE_CLIENT_ID']}&
  #   client_secret=#{ENV['COINBASE_CLIENT_SECRET']}")
  #   current_user.coinbase_access_token = response["access_token"]
  #   current_user.save
  # end

end