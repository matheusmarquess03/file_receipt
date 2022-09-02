class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :person, null: false, foreign_key: true
      t.string :street
      t.string :number

      t.timestamps
    end
  end
end
