class User < ApplicationRecord
    has_many :meals
    has_many :recipes, through: :meals

    validates :name, :email_address, uniqueness: true, presence: true

    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(name: auth[:info][:name]) do |u|
            u.email_address = auth.info.email
            u.password = SecureRandom.hex

        end
    end
end
