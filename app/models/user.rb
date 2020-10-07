class User < ApplicationRecord
    has_many :meals
    has_many :recipes, through: :meals

    validates :name, :email_address, uniqueness: true, presence: true

    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(name: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
        end
    end
end
