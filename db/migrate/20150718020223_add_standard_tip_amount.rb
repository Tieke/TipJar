class AddStandardTipAmount < ActiveRecord::Migration
  def change
    add_column :tippers, :standard_tip_amount, :decimal, default: 0.01
  end
end

