require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/" do
  @cocktails = Cocktail.all
  erb :index
end

get "/yann" do
  "yann's page"
end
