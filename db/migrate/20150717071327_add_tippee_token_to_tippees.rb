class AddTippeeTokenToTippees < ActiveRecord::Migration
  def change
    add_column :tippees, :tippee_token, :string
  end
end
