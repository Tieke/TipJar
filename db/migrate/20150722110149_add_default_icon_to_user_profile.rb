class AddDefaultIconToUserProfile < ActiveRecord::Migration
  def change
  	change_column_default(:users, :image_url, 'https://s3-ap-southeast-2.amazonaws.com/tipjarwellington/images/tipjar-logo.png')
  end
end
