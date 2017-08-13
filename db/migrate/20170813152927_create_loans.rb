class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.references :soldier, foreign_key: true
      t.references :material_reserve, foreign_key: true
      t.references :ammunition, foreign_key: true
      t.references :armaments, foreign_key: true
      t.references :accessories, foreign_key: true
      t.integer :ammunition_amount
      t.integer :armaments_amount
      t.integer :accessories_amount
      t.datetime :date

      t.timestamps
    end
  end
end
