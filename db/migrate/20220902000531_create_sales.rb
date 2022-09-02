class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.references :item, null: false, foreign_key: true
      t.references :purchaser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
