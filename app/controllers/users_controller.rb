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
		amount = params[:amount]
		credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:first_name],
                :last_name          => params[:last_name],
                :number             => params[:number],
                :month              => params[:month],
                :year               => params[:year],
                :verification_value => params[:verification_value])
		# Validating the card automatically detects the card type
		if credit_card.validate.empty?
		  # Capture $10 from the credit card
		  response = gateway.purchase(amount, credit_card)

		  if response.success?
		    puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
		    current_user.increase_balance(amount)
		    current_user.deposit.create(amount: amount)
		  else
		    raise StandardError, response.message
		  end
		end
	end

	def retrieve_checkout 
		amount = params[:amount]
		credit_card = ActiveMerchant::Billing::CreditCard.new(
	              :first_name         => params[:first_name],
	              :last_name          => params[:last_name],
	              :number             => params[:number],
	              :month              => params[:month],
	              :year               => params[:year],
	              :verification_value => params[:verification_value])
		# Validating the card automatically detects the card type
		if credit_card.validate.empty?
		  # Capture $10 from the credit card
		  response = gateway.purchase(amount, credit_card)

		  if response.success?
		    puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
		    current_user.decrease_balance(amount)
		    current_user.withdrawal.create(amount: amount)

		  else
		    raise StandardError, response.message
		  end
		end
	end

	# private
	# def user_params
	# 	params.require(:user).permit(:username, :full_name, :email, :image_url)
	# end

end
