class Ingredient < ApplicationRecord
  has_many :recipes 
  has_many :meals, through: :recipes

  validates :food_item, uniqueness: true, presence: true
  # validates :amount, presence: true <--may not not need to be required

end

#should an ingredient only belong to one recipe? revisit