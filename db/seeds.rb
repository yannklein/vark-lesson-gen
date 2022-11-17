require "faker"

puts "Destroy the pokemons :'("
Pokemon.destroy_all

puts "Create 10 pokemons ⚡️"
10.times do 
  Pokemon.create!(
    name: Faker::Games::Pokemon.name,
    move: Faker::Games::Pokemon.move,
    location: Faker::Games::Pokemon.location
  )

  # pokemon = Pokemon.new(
  #   name: Faker::Games::Pokemon.name,
  #   move: Faker::Games::Pokemon.move,
  #   location: Faker::Games::Pokemon.location
  # )
  # pokemon.save
end
puts "Done!"
