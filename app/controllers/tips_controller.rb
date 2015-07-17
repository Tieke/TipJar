class TipsController < ApplicationController

	def index
		@tips = Tip.all
		render json: @tips
	end

	def show
		@tip = Tip.find(params[:id])		
		render json: @tip
	end

end
