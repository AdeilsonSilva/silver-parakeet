class CreateAmmunitions < ActiveRecord::Migration[5.1]
  def change
    create_table :ammunitions do |t|
      t.string :caliber
      t.string :description

      t.timestamps
    end
  end
end
