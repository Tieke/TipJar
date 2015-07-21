class AddCoinbaseClientAccessTokenToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :coinbase_access_token, :string
  end
end
