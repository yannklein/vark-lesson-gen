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
require_relative 'generate_slides'

get '/' do
  @lessons = Lesson.all
  erb :index
end

get '/lessons/:id' do
  @id = params[:id]
  @lesson = Lesson.find(params[:id])
  @lesson.content
  @lesson_markdown = generate_markdown(@lesson.content)

  erb :show
end

get '/lessons/:id/slides' do
  @id = params[:id]
  @lesson = Lesson.find(params[:id])
  # byebug
  erb :slides
end

post '/lessons/:id' do
  @lesson = Lesson.find(params[:id])
  same_content = @lesson.content == params[:content]
  @lesson.content = params[:content]
  if @lesson.transcripts.empty? || !same_content
    @lesson.transcripts = generate_transcript(@lesson.content)
    @lesson.transcripts.each_with_index do |transcript, index|
      generate_speech(transcript, index)
    end
  end
  # @lesson.slides = @lesson.transcripts.map do |transcript|
  #   generate_slides(transcript)
  # end
  @lesson.save
  redirect "/lessons/#{params[:id]}"
end