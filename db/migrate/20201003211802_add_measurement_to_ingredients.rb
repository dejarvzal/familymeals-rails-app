class AddMeasurementToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :measurement, :string
  end
end
