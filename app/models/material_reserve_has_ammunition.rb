class MaterialReserveHasAmmunition < ApplicationRecord
  belongs_to :material_reserve
  belongs_to :ammunition
end
