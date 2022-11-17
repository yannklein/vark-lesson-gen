require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/pokemons" do
  @pokemons = Pokemon.all
  erb :index
end
