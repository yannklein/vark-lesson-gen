require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"
require_relative 'notion_test'


# app.rb = Router + Controller

# http://localhost:4567 /   --> root
get "/" do
  # get/set data from/to model
  @pokemons = Pokemon.all
  # display stuff on the view
  erb :index
end

# http://localhost:4567 /yann
get "/yann" do
  "hi yann"
end






















get '/notion' do
  @title = init_notion
  erb :notion_test
end