class UsersController < ApplicationController

	def index 
		@users = User.all
		render json: @users
	end

	def show
		@user = User.find(params[:id])
		render json: @user
	end

	# private
	# def user_params
	# 	params.require(:user).permit(:username, :full_name, :email, :image_url)
	# end

end
