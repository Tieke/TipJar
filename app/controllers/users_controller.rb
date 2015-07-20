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
		redirect_to "https://sandbox.coinbase.com/oauth/authorize?response_type=code&client_id=#{ENV['COINBASE_CLIENT_ID']}&redirect_uri=http://localhost:3000/users/auth/coinbase/callback&scope=wallet:accounts:read"
	end

	def retrieve_checkout 

	end

	def topup
		@user = current_user
	end

  def transfer
  	p response = HTTParty.post("https://api.sandbox.coinbase.com/v2/accounts/#{current_user.coinbase_user_id}/transactions", headers: {"Content-Type" => "application/json", "Authorization" => "Bearer #{current_user.coinbase_access_token}"}, data: {"type" => "transfer", "to" => "ad08c2cd-dd4f-5462-8bc1-9e8d7b304c0c", "amount" => "0.01"})
  end

end