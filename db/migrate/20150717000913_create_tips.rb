class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.belongs_to :tipper
      t.belongs_to :tippee
      t.string :url
      t.decimal :amount
      t.string :message
      t.timestamps null: false
    end
  end
end
