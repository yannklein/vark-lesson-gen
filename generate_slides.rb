require 'openai'

def generate_slides(text)

  OpenAI.configure do |config|
    config.access_token = ENV["OPENAI_API_KEY"]
  end

  client = OpenAI::Client.new
  puts '-' * 50
  puts "Sending request to OpenAI API to generate an illustration..."
  puts '-' * 50
  response = client.images.generate(parameters: { 
    model: 'dall-e-3', 
    prompt: "A school lesson presentation slide illustrating this teacher's speech: #{text}"
  })
  p response.dig("data", 0, "url")
end