class AddCoinbaseUserIdToUser < ActiveRecord::Migration
  def change
  	add_column :users, :coinbase_user_id, :string
  end
end
