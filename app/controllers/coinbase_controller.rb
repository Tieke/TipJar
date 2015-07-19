coinbase_credentials = current_user.credentials
coinbase_credentials.with_lock do
  coinbase = Coinbase::OAuthClient.new(ENV['COINBASE_CLIENT_ID'], ENV['COINBASE_CLIENT_SECRET'], coinbase_credentials.credentials)
  begin
    @balance = coinbase.balance
  ensure
    coinbase_credentials.credentials = coinbase.credentials
    coinbase_credentials.save
  end
end