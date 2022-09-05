class AddReferenceUserToSales < ActiveRecord::Migration[6.0]
  def change
    add_reference :sales, :user
  end
end
