class Recipe < ApplicationRecord
    has_many :users, through: :meals
    belongs_to :meal, optional: true
    has_many :ingredients, :dependent => :destroy
  
    # validates :name, presence: true
    validates :name, :instruction, presence: true

    # def current_meal
    #     Meal.find_by_id(:meal_id)
    # end

end