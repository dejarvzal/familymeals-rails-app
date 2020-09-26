class Recipe < ApplicationRecord
    has_many :users, through: :meals
    belongs_to :meal, optional: true
    has_many :ingredients
  
    # validates :name, presence: true
    # validates :name, :instruction, presence: true

end