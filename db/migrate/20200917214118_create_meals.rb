class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :category
      t.date :date
      t.string :name
      t.text :notes
      t.integer :rating

      t.timestamps
    end
  end
end
