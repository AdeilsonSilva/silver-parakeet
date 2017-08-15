class CreateReserves < ActiveRecord::Migration[5.1]
  def change
    create_table :reserves do |t|
      t.string :initials
      t.string :description

      t.timestamps
    end
  end
end
