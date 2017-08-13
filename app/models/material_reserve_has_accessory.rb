class MaterialReserveHasAccessory < ApplicationRecord
  belongs_to :material_reserve
  belongs_to :accessories
end
