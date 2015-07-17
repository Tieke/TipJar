class CreateTippees < ActiveRecord::Migration
  def change
    create_table :tippees do |t|
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
