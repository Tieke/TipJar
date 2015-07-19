def coinbase
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