class Recipe < ApplicationRecord
    has_many :users, through: :meals
    belongs_to :meal, optional: true
    has_many :ingredients
  
end

#changed the association from belongs_to :meal to has_many