class CreateArmaments < ActiveRecord::Migration[5.1]
  def change
    create_table :armaments do |t|
      t.integer :serial_number
      t.string :manufacturer

      t.timestamps
    end
  end
end
