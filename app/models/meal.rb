class Meal < ApplicationRecord
    belongs_to :user
    has_many :recipes
    has_many :ingredients, through: :recipes

    accepts_nested_attributes_for :recipes

    validates :name, uniqueness: true, presence: true
    validates :category, :date, :recipes, presence: true
    
end

# need to be logged in to create a meal - need validation

#changed the association from belongs_to :recipe to has_many through
