class Soldier < ApplicationRecord
  belongs_to :user
  belongs_to :reserve, class_name: 'Reserve'
end
