class TippersController < ApplicationController
  def update
    tipper = current_user.tipper
    tipper.update_standard_tip_amount(params[:amount])
    redirect_to tip_settings_path(tipper.user)
  end
end