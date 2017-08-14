class Armament < ApplicationRecord
  validates :serial_number, presence: true
  validates :manufacturer, presence: true

end
