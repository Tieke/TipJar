class TipsController < ApplicationController
	before_action :authenticate_user!

	def index
		@tips = Tip.all.map do |tip|
			tip[:giver] = tip.tipper.user
		end
		render json: @tips
	end

	def show
		@tip = Tip.find_by_id(params[:id])
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

	def create
		tipper = Tipper.find_or_create_by(user_id: current_user.id)
		tippee = Tippee.find_by_tippee_token(params[:tippee_token])
		referrer = request.env["HTTP_REFERER"]

		@tip = tipper.tips.new(tippee_id: tippee.id, amount: tipper.standard_tip_amount, url: referrer)

		if @tip.save
			tipper.user.decrease_balance(tipper.standard_tip_amount)
			tippee.user.increase_balance(tipper.standard_tip_amount)
		end
		redirect_to(@tip.url)
	end

end
