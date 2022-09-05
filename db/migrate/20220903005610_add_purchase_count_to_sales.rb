class AddPurchaseCountToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :quantity, :integer
  end
end
