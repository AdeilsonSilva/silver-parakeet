class CreateMaterialReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :material_reserves do |t|
      t.references :reserve, foreign_key: true

      t.timestamps
    end
  end
end
