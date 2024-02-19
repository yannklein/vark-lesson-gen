require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require 'dotenv/load' if development?
require_relative "config/application"


require_relative 'generate_markdown'
require_relative 'generate_transcript'
require_relative 'generate_speech'

get '/' do
  @lessons = Lesson.all
  erb :index
end

get '/lessons/:id' do
  @id = params[:id]
  @lesson = Lesson.find(params[:id])
  @lesson.content.gsub!('\n', "&#13;&#10;")
  @lesson_markdown = generate_markdown(@lesson.content)

  erb :show
end

post '/lessons/:id' do
  @lesson = Lesson.find(params[:id])
  same_content = @lesson.content == params[:content]
  @lesson.content = params[:content]
  if @lesson.transcripts.empty? || !same_content
    @lesson.transcripts = generate_transcript(@lesson.content) 
    generate_speech(@lesson.transcripts)
  end
  
  @lesson.save
  redirect "/lessons/#{params[:id]}"
end





















get '/notion' do
  @title = init_notion
  erb :notion_test
end