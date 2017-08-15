class CreateSoldiers < ActiveRecord::Migration[5.1]
  def change
    create_table :soldiers do |t|
      t.string :graduation
      t.string :war_name
      t.references :user, foreign_key: true
      t.references :reserve, foreign_key: true

      t.timestamps
    end
  end
end
