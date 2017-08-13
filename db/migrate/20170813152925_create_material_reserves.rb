class CreateMaterialReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :material_reserves do |t|

      t.timestamps
    end
  end
end
