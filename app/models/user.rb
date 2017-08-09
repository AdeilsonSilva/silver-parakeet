class User < ApplicationRecord
    has_many :soldiers
    has_secure_password
end
