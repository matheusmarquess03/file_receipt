class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :merchant, references: :people, null: false, foreign_key: { to_table: :people }
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
