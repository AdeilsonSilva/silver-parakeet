class MaterialReserveHasArmament < ApplicationRecord
  belongs_to :armaments
  belongs_to :material_reserve
end
