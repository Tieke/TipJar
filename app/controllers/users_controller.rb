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

	def purchase_checkout
		p "*" * 40
		redirect_to "https://sandbox.coinbase.com/oauth/authorize?response_type=code&client_id=#{ENV['COINBASE_CLIENT_ID']}&redirect_uri=http://localhost:3000/users/auth/coinbase/callback&scope=wallet:accounts:read"
	end

	def retrieve_checkout 

	end

	def topup
		@user = current_user
	end



end
