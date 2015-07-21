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

end
