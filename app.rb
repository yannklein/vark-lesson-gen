require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

# app.rb = Router + Controller

# http://localhost:4567/ (root)
get "/" do
  @pokes = Pokemon.all
  erb :index
end

# http://localhost:4567/about
get "/about" do
  "About Sinatra..."
end





















get '/notion' do
  @title = init_notion
  erb :notion_test
end