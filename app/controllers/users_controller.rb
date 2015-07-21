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
		@user = current_user
  	client = BitPay::SDK::Client.new(api_uri: 'https://test.bitpay.com', pem: "-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIAQv22QBdyErk/ADvCYslTHfHgdn8mb2BA40VymMarbAoAcGBSuBBAAK\noUQDQgAEY8So6hy2Bi5atSV59Jcp8b5gN9QSPsdjlgfjsX6fPpk0mo215+4bc3Wk\nkhxgzbR6RTiKVVuQNgJ16by/vhNIEg==\n-----END EC PRIVATE KEY-----\n")
  	invoice = client.create_invoice(price: params[:amount], currency: params[:currency], facade: "merchant")
  	@invoice_url = invoice["url"]
	end

  def transfer
  end

  def tip_settings
    if current_user.tippee
   		@tippee_token = current_user.tippee.tippee_token
      @tipUrl = "http://localhost:3000/tips/create/"
    else
    	@tippee = Tippee.new(user_id: current_user.id)
    end

    @tipper = current_user.tipper

    render :tip_settings
  end

end


# pem = BitPay::KeyUtils.generate_pem
#  => "-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIAQv22QBdyErk/ADvCYslTHfHgdn8mb2BA40VymMarbAoAcGBSuBBAAK\noUQDQgAEY8So6hy2Bi5atSV59Jcp8b5gN9QSPsdjlgfjsX6fPpk0mo215+4bc3Wk\nkhxgzbR6RTiKVVuQNgJ16by/vhNIEg==\n-----END EC PRIVATE KEY-----\n"
# 2.2client = BitPay::SDK::Client.new(api_uri: 'https://test.bitpay.com', pem: pem)
#  => #<BitPay::SDK::Client:0x007fbd91a56e68 @pem="-----BEGIN EC PRIVATE KEY-----\nMHQCAQEEIAQv22QBdyErk/ADvCYslTHfHgdn8mb2BA40VymMarbAoAcGBSuBBAAK\noUQDQgAEY8So6hy2Bi5atSV59Jcp8b5gN9QSPsdjlgfjsX6fPpk0mo215+4bc3Wk\nkhxgzbR6RTiKVVuQNgJ16by/vhNIEg==\n-----END EC PRIVATE KEY-----\n", @key=#<OpenSSL::PKey::EC:0x007fbd91a56e40 @group=#<OpenSSL::PKey::EC::Group:0x007fbd91a56d50 @key=#<OpenSSL::PKey::EC:0x007fbd91a56e40 ...>>>, @priv_key="42fdb640177212b93f003bc262c9531df1e0767f266f6040e3457298c6ab6c0", @pub_key="0263c4a8ea1cb6062e5ab52579f49729f1be6037d4123ec7639607e3b17e9f3e99", @client_id="TfERdhMsUHmtsD1cZ2tzPk49sCBM5rXu2L3", @uri=#<URI::HTTPS https://test.bitpay.com>, @user_agent="ruby-bitpay-sdk 2.4.4", @https=#<Net::HTTP test.bitpay.com:443 open=false>, @tokens={}>
# 2.2.0 :023 > client.pair_client()
#  => [{"policies"=>[{"policy"=>"id", "method"=>"inactive", "params"=>["TfERdhMsUHmtsD1cZ2tzPk49sCBM5rXu2L3"]}], "token"=>"DZjwZntzQrCEtqqBJUVk2KufhFs3QtJjnqz41X5hgRxj", "dateCreated"=>1437371497231, "pairingExpiration"=>1437457897231, "pairingCode"=>"4DxL2TH"}]


# # HTTParty.post("https://test.bitpay.com/tokens", query: {"label" => "bitjar", "id" => "uvyHZeGcDkUBjsvA4Uc1XwdVHzrjzMX4Yi1nmKuSiuj", "facade" => "Point-of-Sale"})

# # HTTParty.get("https://api.sandbox.coinbase.com/v2/user", headers: {"Authorization" => "Bearer #{current_user.coinbase_access_token}" })