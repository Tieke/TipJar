class UsersController < ApplicationController
	# before_action :authenticate_user!

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

	def initiate

	end

	def retrieve_checkout 

	end

	def topup
		p @user = current_user
  	p client = BitPayClient.last
  	p invoice = client.create_invoice(price: "5.00", currency: "USD", facade: "merchant")
  	@invoice_url = invoice["url"]
	end

  def transfer
  end

end