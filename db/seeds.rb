require 'open-uri'
require 'json'

base_url = "https://pokeapi.co/api/v2/pokemon-form/"

puts "Destroying pokemons..."
Pokemon.destroy_all

puts "Seeding 10 pokemons..."
10.times do
  random_url = "#{base_url}#{rand(1..1000)}"
  poke_serialized = URI.open(random_url).read
  poke_data = JSON.parse(poke_serialized)

  poke = Pokemon.new(
    name: poke_data["name"], 
    image_url: poke_data["sprites"]["front_default"],
    poke_type: poke_data["types"][0]["type"]["name"]
  )
  poke.save!
  # CREATE = NEW + SAVE
  # Pokemon.create!(
  #   name: poke_data["name"], 
  #   image_url: poke_data["sprites"]["front_default"],
  #   poke_type: poke_data["types"][0]["type"]["name"]
  # )
  puts "Pokemon #{poke_data["name"]} as been created."
end
puts "Done!"
