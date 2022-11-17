require "json"
require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"

puts "Destroying legacy cocktails..."
Cocktail.destroy_all
puts "Done!"

puts "Creating 10 new cocktails"
10.times do
  cocktail_serialized = URI.open(url).read
  cocktail = JSON.parse(cocktail_serialized)["drinks"][0]
  Cocktail.create!(
    name: cocktail["strDrink"],
    instructions: cocktail["strInstructionsIT"],
    photo_url: cocktail["strDrinkThumb"]
  )
  # cocktail = Cocktail.new!(
  #   name: cocktail["strDrink"],
  #   instructions: cocktail["strInstructionsIT"],
  #   photo_url: cocktail["strDrinkThumb"]
  # )
  # cocktail.save!
end
puts "Done"