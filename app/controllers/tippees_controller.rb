class TippeesController < ApplicationController
  before_action :authenticate_user!

  def create
    @tippee = Tippee.create(user_id: current_user.id)
    redirect_to "/users/#{current_user.id}/tip_settings"
  end

end