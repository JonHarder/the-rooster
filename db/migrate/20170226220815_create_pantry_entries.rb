class CreatePantryEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :pantry_entries do |t|
      t.decimal :amount
      t.references :ingredient, foreign_key: true
      t.references :unit, foreign_key: true

      t.timestamps
    end
  end
end
