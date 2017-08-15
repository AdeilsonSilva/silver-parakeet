class Loan < ApplicationRecord
  belongs_to :reserve
  belongs_to :soldier
  belongs_to :material_reserve
  belongs_to :ammunition
  belongs_to :armaments
  belongs_to :accessories
end
