class TippeesController < ApplicationController
  before_action :authenticate_user!

  def token
    if !current_user.tippee
      @tippee = Tippee.new(user_id: current_user.id)
      render :new
    else
      @tippee_token = current_user.tippee.tippee_token
      @tipUrl = "http://localhost:3000/tips/create/"
      render :token
    end
  end

  def new
    @tippee = Tippee.new
  end

  def create
    @tippee = Tippee.create(user_id: current_user.id)
    redirect_to "/users/#{current_user.id}/token"
  end

end