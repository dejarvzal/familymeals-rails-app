class AddRecipeIdToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :recipe_id, :integer
  end
end
