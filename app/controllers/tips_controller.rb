class TipsController < ApplicationController
	# before_action :authenticate_user!

	def index
		@tips = Tip.all
		@data = formatTipsWithUsers(@tips)
		render json: @data
	end

	def show
		@tip = Tip.find_by_id(params[:id])
		render json: @tip
	end

	def given
		@tips_given = User.find(params[:user_id]).tipper.tips
		@data = formatTipsWithUsers(@tips_given)
		render json: @data
	end

	def received
		@tips_received = User.find(params[:user_id]).tippee.tips
		@data = formatTipsWithUsers(@tips_received)
		render json: @data
	end

	def new
	end

	def create
		tipper = Tipper.find_or_create_by(user_id: current_user.id)
		tippee = Tippee.find_by_tippee_token(params[:tippee_token])
		referrer = request.env["HTTP_REFERER"]

		@tip = tipper.tips.new(tippee_id: tippee.id, amount: tipper.standard_tip_amount, url: referrer)

		if @tip.save
			redirect_to(@tip.url)
			tipper.user.decrease_balance(tipper.standard_tip_amount)
			tippee.user.increase_balance(tipper.standard_tip_amount)
		else
			render 'new', status: 400
		end
	end

	private

	def formatTipsWithUsers(tips)
		outputData = []
		givers = Tip.all.map { |tip| tip.tipper.user }
		receivers = Tip.all.map { |tip| tip.tippee.user }
		givers.length.times do | i |
			outputData.push(
				{
					tip: tips[i],
					giver: {
						userName: givers[i].username,
						id: givers[i].id,
						image_url: givers[i].image_url
					},
					receiver: {
						userName: receivers[i].username,
						id: receivers[i].id,
						image_url: receivers[i].image_url
					}
				}
			)
		end	
		outputData
	end

end
