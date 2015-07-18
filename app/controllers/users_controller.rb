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

	end

	def retrieve_checkout 

	end



	# private
	# def user_params
	# 	params.require(:user).permit(:username, :full_name, :email, :image_url)
	# end

end
