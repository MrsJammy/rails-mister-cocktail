# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

puts "Retrieving ingredients"
response_id = RestClient.get "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
id_array = JSON.parse(response_id)

puts 'Creating ingredients'

# p id_array.first[1]
id_array.first[1].take(10).each do |element|
  Ingredient.create!(name: element["strIngredient1"])
end

puts 'Well done!'


Cocktail.create!(name: "Mint Julep")
Cocktail.create!(name: "Whiskey Sour")
Cocktail.create!(name: "Mojito")


Dose.create!(description: "1", ingredient_id: 1, cocktail_id: 3)
Dose.create!(description: "3", ingredient_id: 2, cocktail_id: 3)
Dose.create!(description: "10", ingredient_id: 3, cocktail_id: 3)
