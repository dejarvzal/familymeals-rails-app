class Recipe < ApplicationRecord
    has_many :users, through: :meals
    belongs_to :meal, optional: true
    has_many :ingredients
  
    validates :name, uniqueness: true, presence: true
    validates :instruction, presence: true

end