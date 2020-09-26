class Ingredient < ApplicationRecord
  has_many :recipes
  has_many :meals, through: :recipes

end
