class PagesController < ApplicationController

  def page
  end

  def home
  	if current_user
  		redirect_to browse_path
  	else
  		render :home
  	end
  end

end
