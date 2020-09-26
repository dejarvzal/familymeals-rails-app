class Meal < ApplicationRecord
    belongs_to :user
    has_many :recipes
    has_many :ingredients, through: :recipes

    accepts_nested_attributes_for :recipes
    
end

#changed the association from belongs_to :recipe to has_many through