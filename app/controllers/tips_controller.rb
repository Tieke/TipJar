class TipsController < ApplicationController
	before_action :authenticate_user!, except: :random

  def random
    @tip = Tip.all.sample
    render json: @tip
  end

	def index
		@tips = Tip.all.reverse
		@data = formatTipsWithUsers(@tips)
		render json: @data
	end

	def show
		@tip = Tip.find_by_id(params[:id])
		render json: @tip
	end

	def given
		if User.find(params[:user_id]).tipper
			@tips_given = User.find(params[:user_id]).tipper.tips.reverse
			@data = formatTipsWithUsers(@tips_given)
			render json: @data
		else
			redirect_to browse_path
		end
	end

	def received
		if User.find(params[:user_id]).tippee 
			@tips_received = User.find(params[:user_id]).tippee.tips.reverse
			@data = formatTipsWithUsers(@tips_received)
			render json: @data
		else
			redirect_to browse_path
		end
	end

	def create
		tipper = Tipper.find_or_create_by(user_id: current_user.id)
		tippee = Tippee.find_by_tippee_token(params[:tippee_token])
		referrer = request.env["HTTP_REFERER"]
		link_object = LinkThumbnailer.generate(referrer)

		@tip = tipper.tips.new(
			tippee_id: tippee.id,
			amount: tipper.standard_tip_amount,
			url: referrer,
			link_title: (link_object.title) ? link_object.title : '',
			link_thumbnail: (link_object.images.length > 0 ? link_object.images.first.src.to_s : 'http://www.saidaonline.com/en/newsgfx/space%20walk-saidaonline.jpg'),
      link_description: link_object.description ? link_object.description : ''
    )

		if @tip.save
			tipper.user.decrease_balance(tipper.standard_tip_amount)
			tippee.user.increase_balance(tipper.standard_tip_amount)
		end
		redirect_to(@tip.url)
	end

	private

	def formatTipsWithUsers(tips)
		outputData = []
		givers = tips.map { |tip| tip.tipper.user }
		receivers = tips.map { |tip| tip.tippee.user }
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
