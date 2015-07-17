class CreateTippers < ActiveRecord::Migration
  def change
    create_table :tippers do |t|
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
