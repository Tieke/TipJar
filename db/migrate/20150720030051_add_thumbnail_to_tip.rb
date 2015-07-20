class AddThumbnailToTip < ActiveRecord::Migration
  def change
    add_column :tips, :thumbnail, :string
  end
end
