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

	def topup
		p @user = current_user
  	p client = BitPayClient.last
  	p invoice = client.create_invoice(price: "5.00", currency: "USD", facade: "merchant")
  	@invoice_url = invoice["url"]
	#background job starts
		#check invoice["status"] every 2 minutes until status == paid || pending
			#if it us, update balance with amount converted to standarized currency
		#else 
			#balance update pending page
	end

  def withdraw
  	@user = current_user
  	client = BitPayClient.last
  	payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>1.00,'currency'=>'USD','account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>'n4JvFCnA1WRFiEreWnLLLm8xrsMzRmL6hZ', 'instructions'=>['test instructions'], 'effectiveDate'=>"#{Date.today}"})

		# payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>params[:amount],'currency'=>params[:currency],'account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>params[:address], 'facade'=>'Merchant', 'instructions'=>[], 'effectiveDate'=>Date.today})
  end

end

HTTParty.post("test.bitpay.com/tokens", query: {'label'=>'TipJar', 'id'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'pairingCode'=>'bpsPdGQ'})