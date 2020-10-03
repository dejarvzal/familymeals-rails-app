# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

models = [User, Meal, Recipe, Ingredient]

#Reset All Table Data

models.each do |model|
    model.destroy_all
    ActiveRecord::Base.connection.reset_sequence!("#{model.to_s.downcase + "s"}", "id", squence = nil)
end

User.create!(
    name: "Dianne",
    email_address: "dianne@gmail.com",
    password: "123"
)

User.create!(
    name: "Ebony",
    email_address: "ebony@gmail.com",
    password: "123"
)

p "#{User.count} Users created!"

3.times do 
    Meal.create!(
        # meal_id: Faker::Number.between(from Meal.first.id, to: Meal.last.id),
        # category: Faker::Food.description,
        category: "Breakast",
        name: Faker::Food.unique.dish,
        date: Faker::Date.backward(days: 30),
        notes: Faker::Food.description
    )
end

3.times do 
    Meal.create!(
        # meal_id: Faker::Number.between(from Meal.first.id, to: Meal.last.id),
        # category: Faker::Food.description,
        category: "Lunch",
        name: Faker::Food.unique.dish,
        date: Faker::Date.backward(days: 30),
        notes: Faker::Food.description
    )
end

3.times do 
    Meal.create!(
        # meal_id: Faker::Number.between(from Meal.first.id, to: Meal.last.id),
        # category: Faker::Food.description,
        category: "Brunch",
        name: Faker::Food.unique.dish,
        date: Faker::Date.backward(days: 30),
        notes: Faker::Food.description
    )
end

3.times do 
    Meal.create!(
        # meal_id: Faker::Number.between(from Meal.first.id, to: Meal.last.id),
        # category: Faker::Food.description,
        category: "Dinner",
        name: Faker::Food.unique.dish,
        date: Faker::Date.backward(days: 30),
        notes: Faker::Food.description
    )
end

p "#{Meal.count} Meals created!"

10.times do 
    Recipe.create!(
        meal_id: Faker::Number.between(from: Meal.first.id, to: Meal.last.id),
        instruction: Faker::Food.description,
        is_vegan: Faker::Boolean.boolean,
        name: Faker::Food.unique.dish
    )
end

p "#{Recipe.count} Recipes created!"

10.times do 
    Ingredient.create!(
        recipe_id: Faker::Number.between(from: Recipe.first.id, to: Recipe.last.id),
        food_item: Faker::Food.ingredient,
        amount: Faker::Number.between(from: 2.00, to: 10.00),
        measurement: Faker::Food.measurement    
    )
end

p "#{Ingredient.count} Ingredients created!"
