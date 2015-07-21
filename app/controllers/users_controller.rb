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
  	p client = BitPayClient.last
  	p invoice = client.create_invoice(price: params[:price], currency: params[:currency], facade: "merchant")
  	@invoice_url = invoice["url"]
  	@bits_purchased = invoice["btcPrice"]*1_000_000
  	deposit = Deposit.create(user_id: current_user.id, amount: @bits_purchased, invoice_id: invoice["id"])
  	current_user.increase_balance(@bits_purchased)
	#background job starts
		#check invoice["status"] every 2 minutes until status == paid || pending
			#if it us, update balance with amount converted to standarized currency
		#else 
			#balance update pending page
	end

  def withdraw
  	client = BitPayClient.last
  	last_invoice_id = Deposit.find_by_user_id(current_user.id).invoice_id
  	last_invoice = client.get_invoice(id: last_invoice_id)
  	@bits_refunded = invoice["btcPrice"]*1_000_000

  	refund = refund_invoice(id: last_invoice["id"], params: {amount: params[:amount], currency: params[:currency]})
  	withdrawal = Withdrawal.create(user_id: current_user.id, amount: @bits_refunded, invoice_id: invoice["id"])
  	current_user.decrease_balance(@bits_refunded)
  	
  	# payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>1.00,'currency'=>'USD','account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>'n4JvFCnA1WRFiEreWnLLLm8xrsMzRmL6hZ', 'instructions'=>['test instructions'], 'effectiveDate'=>"#{Date.today}"})

		# payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>params[:amount],'currency'=>params[:currency],'account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>params[:address], 'facade'=>'Merchant', 'instructions'=>[], 'effectiveDate'=>Date.today})
  end

end

# HTTParty.post("https://test.bitpay.com/tokens", query: {'label'=>'TipJar', 'id'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'pairingCode'=>'bpsPdGQ'})