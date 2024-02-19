require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

require_relative 'generate_markdown'

get '/' do
  'Go to http://127.0.0.1:4567/lessons/1'
end

get '/lessons/:id' do
  @id = params[:id]
  @lesson = Lesson.find(params[:id])
  @lesson.content.gsub!('\n', "&#13;&#10;")
  # Initializes a Markdown parser
  @lesson_markdown = generate_markdown(@lesson.content)
  erb :index
end

post '/lessons/:id' do
  @lesson = Lesson.find(params[:id])
  @lesson.content = params[:content].strip.gsub!("&#13;&#10;", '\n')
  pry.binding
  @lesson.save
  redirect "/lessons/#{params[:id]}"
end





















get '/notion' do
  @title = init_notion
  erb :notion_test
end