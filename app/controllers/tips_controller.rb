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

private

	def tip_params
		@tippee_id = Tippee.find_by_tippee_token(params[:tippee_token]).id
		@tipper_id = current_user.id
	  params.require(:tip).permit(:tipper_id, :amount, :tippee_id, :url)
	end

end
