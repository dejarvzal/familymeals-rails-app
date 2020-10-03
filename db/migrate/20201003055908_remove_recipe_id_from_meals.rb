class RemoveRecipeIdFromMeals < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :recipe_id, :integer
  end
end
