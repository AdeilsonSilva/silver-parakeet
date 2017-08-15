class MaterialReserve < ApplicationRecord
  belongs_to :reserve
  has_many :loan
  has_many :material_reserve_has_armaments
  has_many :material_reserve_has_acessories
  has_many :material_reserve_has_ammunition
end
