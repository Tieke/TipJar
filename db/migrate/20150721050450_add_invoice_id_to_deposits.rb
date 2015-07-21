class AddInvoiceIdToDeposits < ActiveRecord::Migration
  def change
  	add_column :deposits, :invoice_id, :string
  end
end
