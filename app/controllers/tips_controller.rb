class TipsController < ApplicationController
	before_action :authenticate_user!

	def index
		@tips = Tip.all
		render json: @tips
	end

	def show
		@tip = Tip.find(params[:id])
		render json: @tip
	end

	def given
		@tips_given = User.find(params[:user_id]).tipper.tips
		render json: @tips_given
	end

	def received
		@tips_received = User.find(params[:user_id]).tippee.tips
		render json: @tips_received
	end

	def new
		@tippee = Tippee.find_by(tippee_token: params[:tippee_token])
	end

	def create
		tipper = Tipper.find_or_create_by(user_id: current_user.id)
		@tip = tipper.tips.new(tip_params)

		if @tip.save
			redirect_to("/tips/#{@tip.id}")
		else
			render 'new', status: 400
		end
	end

private

	def tip_params
	  params.require(:tip).permit(:username, :message, :url, :amount, :tippee_id)
	end

end
