class User < ApplicationRecord
  has_secure_password
  has_many :soldiers

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.+@.+\z/ }
end
