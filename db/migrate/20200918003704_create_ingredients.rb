class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :food_item
      t.integer :amount
      t.belongs_to :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
