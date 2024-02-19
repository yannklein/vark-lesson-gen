class Lesson < ActiveRecord::Base
  serialize :transcripts
  serialize :slides

  after_initialize do |lesson|
    lesson.transcripts= [] if lesson.transcripts == nil
    lesson.slides= [] if lesson.slides == nil
  end
end