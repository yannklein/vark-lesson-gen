class Lesson < ActiveRecord::Base
  serialize :transcripts

  after_initialize do |lesson|
    lesson.transcripts= [] if lesson.transcripts == nil
  end
end