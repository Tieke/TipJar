Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coinbase, ENV["COINBASE_KEY"], ENV["COINBASE_SECRET"], scope: 'user'
end