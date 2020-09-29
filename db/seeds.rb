# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

models = [User, Meal, Recipe, Ingredients]

#Reset All Table Data

models.each do |model|
    model.destroy_all
    ActiveRecord::Base.connection.reset_sequence!("#{model.to_s.downcase + "s"}", "id", squence = nil)
end

User.create!(
    name: "Dianne",
    email_address: "dianne@gmail.com"
    password: "123"
)

User.create!(
    name: "Ebony",
    email_address: "ebony@gmail.com"
    password: "123"
)

p "#{User.count} Users created!"

10.times do 
    Recipe.create!(
        meal_id: Faker::Number.between(from Meal.first.id, to: Meal.last.id),
        instruction: Faker::Hipster.paragraphs,
        is_vegan: Faker::Boolean.boolean,
        name: Faker::Hipster.unique.word
    )
end

p "#{Recipe.count} Users created!"
