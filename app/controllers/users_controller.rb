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

	def follow
		followed = User.find(params[:user_id])
		following = current_user
		Follow.create(followed_id: followed.id, following_id: following.id)
		render nothing: true
	end

	def unfollow
		following = current_user
		followed = User.find(params[:user_id])
		follow = Follow.find_by(followed_id: followed.id, following_id: following.id)
		follow.destroy
		render nothing: true
	end

	def followers
		user = User.find(params[:user_id])
		render json: user.followed_follows
	end

	def following
		user = User.find(params[:user_id])
		render json: user.following_follows
	end

	def following_tips
		user = User.find(params[:user_id])
		tips_of_people_user_follows = []
		user_followings = user.following_follows
		user_followings.each do |user|
			tips_of_people_user_follows << user.tipper.tips
		end
		render json: tips_of_people_user_follows
	end

	def topup
		p "*" * 30
		p params
		p client = BitPayClient.last
		p "$" * 30
  	p invoice = client.create_invoice(price: params[:amount].to_f, currency: "USD", facade: "merchant")
		p "@" * 30
  	p @invoice_url = invoice["url"]
  	# p @bits_purchased = invoice["btcPrice"].to_f*1_000_000
  	p deposit = Deposit.create(user_id: current_user.id, amount: params[:amount].to_f, invoice_id: invoice["id"])
		p "^" * 30
  	p current_user.increase_balance(params[:amount].to_f)
		p "*" * 30
	#background job starts
		#check invoice["status"] every 2 minutes until status == paid || pending
			#if it us, update balance with amount converted to standarized currency
		#else
			#balance update pending page
	end

  def withdraw
  	# client = BitPayClient.last
  	# p last_invoice_id = Deposit.where(user_id: current_user.id).last.invoice_id
  	# p invoice = client.get_invoice(id: last_invoice_id)
  	# p refund = client.refund_invoice(id: invoice["id"], params: {bitcoinAddress: "n4JvFCnA1WRFiEreWnLLLm8xrsMzRmL6hZ", amount: params[:amount].to_f, currency: params[:currency]})
  	# withdrawal = Withdrawal.create(user_id: current_user.id, amount: refund["btcPrice"].to_f*1_000_000)
  	# current_user.decrease_balance(@bits_refunded)

  	withdraw = Withdrawal.create(user_id: current_user.id, amount: params[:amount])
  	current_user.decrease_balance(params[:amount].to_f)
  	redirect_to withdraw_confirmation_path
  end

  def withdraw_confirmation
  end

  def tip_settings
    if current_user.tippee
   		@tippee_token = current_user.tippee.tippee_token
      @tipUrl = "http://localhost:3000/tips/create/"
    else
    	@tippee = Tippee.new(user_id: current_user.id)
    end
    @tipper = current_user.tipper
    @balance = current_user.balance
    render :tip_settings
  end

    def stats
    @user = User.find(params[:user_id])
    if @user.tipper
      @num_of_tips_given = @user.tipper.tips.count
    else
      @num_of_tips_given = 0
    end
    if @user.tippee
      @num_of_tips_recieved = @user.tippee.tips.count
    else
      @num_of_tips_recieved = 0
    end

    # @user.tipper ? @user.tipper.count : 0
    # @num_of_tips_recieved = @user.tippee.count
    render json: { "num_of_tips_given" => @num_of_tips_given,
                    "num_of_tips_recieved" => @num_of_tips_recieved }
  end
end

# HTTParty.post("https://test.bitpay.com/tokens", query: {'label'=>'TipJar', 'id'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'pairingCode'=>'bpsPdGQ'})
# pem = BitPay::KeyUtils.generate_pem
#  => "-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIAQv22QBdyErk/ADvCYslTHfHgdn8mb2BA40VymMarbAoAcGBSuBBAAK\noUQDQgAEY8So6hy2Bi5atSV59Jcp8b5gN9QSPsdjlgfjsX6fPpk0mo215+4bc3Wk\nkhxgzbR6RTiKVVuQNgJ16by/vhNIEg==\n-----END EC PRIVATE KEY-----\n"
# 2.2client = BitPay::SDK::Client.new(api_uri: 'https://test.bitpay.com', pem: pem)
#  => #<BitPay::SDK::Client:0x007fbd91a56e68 @pem="-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIAQv22QBdyErk/ADvCYslTHfHgdn8mb2BA40VymMarbAoAcGBSuBBAAK\noUQDQgAEY8So6hy2Bi5atSV59Jcp8b5gN9QSPsdjlgfjsX6fPpk0mo215+4bc3Wk\nkhxgzbR6RTiKVVuQNgJ16by/vhNIEg==\n-----END EC PRIVATE KEY-----\n", @key=#<OpenSSL::PKey::EC:0x007fbd91a56e40 @group=#<OpenSSL::PKey::EC::Group:0x007fbd91a56d50 @key=#<OpenSSL::PKey::EC:0x007fbd91a56e40 ...>>>, @priv_key="42fdb640177212b93f003bc262c9531df1e0767f266f6040e3457298c6ab6c0", @pub_key="0263c4a8ea1cb6062e5ab52579f49729f1be6037d4123ec7639607e3b17e9f3e99", @client_id="TfERdhMsUHmtsD1cZ2tzPk49sCBM5rXu2L3", @uri=#<URI::HTTPS https://test.bitpay.com>, @user_agent="ruby-bitpay-sdk 2.4.4", @https=#<Net::HTTP test.bitpay.com:443 open=false>, @tokens={}>
# 2.2.0 :023 > client.pair_client()
#  => [{"policies"=>[{"policy"=>"id", "method"=>"inactive", "params"=>["TfERdhMsUHmtsD1cZ2tzPk49sCBM5rXu2L3"]}], "token"=>"DZjwZntzQrCEtqqBJUVk2KufhFs3QtJjnqz41X5hgRxj", "dateCreated"=>1437371497231, "pairingExpiration"=>1437457897231, "pairingCode"=>"4DxL2TH"}]
  	# payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>1.00,'currency'=>'USD','account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>'n4JvFCnA1WRFiEreWnLLLm8xrsMzRmL6hZ', 'instructions'=>['test instructions'], 'effectiveDate'=>"#{Date.today}"})

		# payout_response = HTTParty.post("https://test.bitpay.com/payouts", query: {'amount'=>params[:amount],'currency'=>params[:currency],'account'=>'TewzSJHWriVowxFYgAsa1TrZzkxnegawhcc', 'address'=>params[:address], 'facade'=>'Merchant', 'instructions'=>[], 'effectiveDate'=>Date.today})