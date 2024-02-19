require 'openai'

def generate_speech(transcripts)
  OpenAI.configure do |config|
    config.access_token = ENV["OPENAI_API_KEY"]
  end

  client = OpenAI::Client.new
  response = client.audio.speech(
    parameters: {
      model: "tts-1",
      input: transcripts.join(" - "),
      voice: "alloy"
    }
  )
  File.binwrite('public/speech.mp3', response)
end