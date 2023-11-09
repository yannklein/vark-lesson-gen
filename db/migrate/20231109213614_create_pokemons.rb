class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :image_url
      t.string :poke_type
      t.timestamps
    end
  end
end