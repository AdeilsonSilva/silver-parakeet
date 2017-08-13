class CreateMaterialReserveHasArmaments < ActiveRecord::Migration[5.1]
  def change
    create_table :material_reserve_has_armaments do |t|
      t.references :armaments, foreign_key: true
      t.references :material_reserve, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
