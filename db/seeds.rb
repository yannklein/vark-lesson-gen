require "json"
require "open-uri"

puts "Delete all the pokemons..."
Pokemon.destroy_all
puts "Deleted!"

puts "Create pokemons..."
10.times do
  url = "https://pokeapi.co/api/v2/pokemon/#{rand(1..1400)}"
  puts url
  pokemon_json_data = URI.open(url).read
  pokemon_data = JSON.parse(pokemon_json_data)
  # The following are the same:
  # poke = Pokemon.new
  # poke.save
  # OR
  # poke = Pokemon.create
  puts "Create #{pokemon_data["name"]}..."
  Pokemon.create!(
    name: pokemon_data["name"],
    poke_type: pokemon_data["types"][0]["type"]["name"],
    height: pokemon_data["height"],
    image_url: pokemon_data["sprites"]["other"]["official-artwork"]["front_default"]
  )
end
puts "Finished!"

