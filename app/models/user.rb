class User < ApplicationRecord
    has_many :meals
    has_many :recipes, through: :meals

    validates :name, :email_address, uniqueness: true, presence: true

    has_secure_password
end
