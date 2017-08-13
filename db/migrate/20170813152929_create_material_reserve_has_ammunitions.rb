class CreateMaterialReserveHasAmmunitions < ActiveRecord::Migration[5.1]
  def change
    create_table :material_reserve_has_ammunitions do |t|
      t.references :material_reserve, foreign_key: true
      t.references :ammunition, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
