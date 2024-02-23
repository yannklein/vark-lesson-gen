require 'openai'

def generate_speech(transcript, index)
  OpenAI.configure do |config|
    config.access_token = ENV["OPENAI_API_KEY"]
  end

  client = OpenAI::Client.new
  response = client.audio.speech(
    parameters: {
      model: "tts-1",
      input: transcript,
      voice: "alloy"
    }
  )
  File.binwrite("public/speech#{index}.mp3", response)
end