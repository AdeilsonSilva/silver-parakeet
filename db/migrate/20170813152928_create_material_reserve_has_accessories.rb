class CreateMaterialReserveHasAccessories < ActiveRecord::Migration[5.1]
  def change
    create_table :material_reserve_has_accessories do |t|
      t.references :material_reserve, foreign_key: true
      t.references :accessories, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
