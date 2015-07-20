class AddFieldsToTips < ActiveRecord::Migration
  def change
    add_column :tips, :link_title, :string
    add_column :tips, :link_thumbnail, :string
    add_column :tips, :link_description, :text
    remove_column :tips, :thumbnail, :string
  end
end
