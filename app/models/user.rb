class User < ApplicationRecord
    has_many :meals
    has_many :recipes, through: :meals

    has_secure_password
end
