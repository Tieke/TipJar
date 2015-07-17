class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.decimal :amount
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
