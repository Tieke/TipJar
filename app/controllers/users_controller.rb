class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		render json: @users
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	def transactions
		@user = User.find(params[:user_id])
		@withdrawals = @user.withdrawals
		@deposits = @user.deposits
		render json: { "withdrawals" => @withdrawals, "deposits" => @deposits }
	end

	def initiate_coinbase
		p "*" * 40
		redirect_to "https://sandbox.coinbase.com/oauth/authorize?response_type=code&client_id=#{ENV['COINBASE_CLIENT_ID']}&redirect_uri=http://localhost:3000/users/auth/coinbase/callback&scope=wallet:transactions:transfer"
	end

	def retrieve_checkout 

	end

	def topup
		@user = current_user
	end

  def transfer
  	p "wallet"
		p wallet = Coinbase::Client.new(api_key: "B38UjEXUmI5cun3a", api_secret: "eOyvBiMIjXTMt6cEx1q13VsTWLmQSWJ0", api_url: "https://api.sandbox.coinbase.com")
		p "client"
  	p client = Coinbase::OAuthClient.new(ENV['COINBASE_CLIENT_ID'], ENV['COINBASE_CLIENT_SECRET'], access_token: "88fc2d5d6ec1e31dcf17610aba71257947d11dd6a31736533f5ff0c695ee3232")
  	p client.account
  	# p user  = client.user(current_user.coinbase_user_id)
  	# p user_accounts = user.accounts
  	# p account = client.primary_account
  	# account.send(to: <bitcoin address>, amount: "5.0", currency: "USD", description: "Your first bitcoin!")
  	# p response = HTTParty.post("https://api.sandbox.coinbase.com/v2/accounts/#{current_user.coinbase_user_id}/transactions", query: {"type" => "send", "to" => "ad08c2cd-dd4f-5462-8bc1-9e8d7b304c0c", "amount" => "0.01", "currency" => "BTC"}, headers: {"Content-Type" => "application/json", "Authorization" => "Bearer #{current_user.coinbase_access_token}"})

  end

end

# curl https://api.coinbase.com/v2/accounts/2bbf394c-193b-5b2a-9155-3b4732659ede/transactions /
#   -X POST \
#   -H 'Content-Type: application/json' \
#   -H 'Authorization: Bearer abd90df5f27a7b170cd775abf89d632b350b7c1c9d53e08b340cd9832ce52c2c' \
#   -d '{
#     "type": "transfer",
#     "to": "58542935-67b5-56e1-a3f9-42686e07fa40",
#     "amount": "1"
#   }'

# HTTParty.get("https://api.sandbox.coinbase.com/v2/accounts/0cd6131a-45da-5a15-9bef-5b976ee3352c", headers: {"Content-Type" => "application/json", "Authorization" => "Bearer 2328a7e18b7daccc3624ddb589de9a20d0c11ce701dfd17348fc58d9d7f3ab3e"})

# HTTParty.post("https://api.sandbox.coinbase.com/v2/accounts/0cd6131a-45da-5a15-9bef-5b976ee3352c/transactions", query: {"type" => "send", "to" => "ad08c2cd-dd4f-5462-8bc1-9e8d7b304c0c", "amount" => "0.01", "currency" => "BTC"}, headers: {"Content-Type" => "application/json", "Authorization" => "Bearer 88fc2d5d6ec1e31dcf17610aba71257947d11dd6a31736533f5ff0c695ee3232"})

# developer token 8a5898627b61eb3bc888c00d4cc1786b8acf7ff8d732977cd3b7b925c1bb2ccc



#duck id 0cd6131a-45da-5a15-9bef-5b976ee3352c
#kyle id ad08c2cd-dd4f-5462-8bc1-9e8d7b304c0c

# curl https://api.coinbase.com/v1/users/self/?access_token=88fc2d5d6ec1e31dcf17610aba71257947d11dd6a31736533f5ff0c695ee3232

