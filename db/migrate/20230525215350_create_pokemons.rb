class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :poke_type
      t.integer :height
      t.string :image_url
      t.timestamps
    end
  end
end