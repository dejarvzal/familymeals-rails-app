class Meal < ApplicationRecord
    belongs_to :user, optional: true
    has_many :recipes,  :dependent => :destroy
    has_many :ingredients, through: :recipes

    accepts_nested_attributes_for :recipes

    validates :name, :category, :date, presence: true
    # validates :category, :date, :recipes, presence: true
   
    def recipes_attributes=(attributes)
        recipe = Recipe.find_or_create_by(attributes) if !attributes['name'].nil?
    end

    # def not_a_duplicate
    #     if Meal.find_by(name: name, date: date)
    #         errors.add(:name, "has already been added for that date!")
    #     end
    # end

end
#meal cannot be duplicated for the same date

#changed the association from belongs_to :recipe to has_many through
