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
    prompt: [
      { role: "system", content: "You are a very outgoing and charismatic teacher that excels in giving clear and entertaining lecture to a classroom."},
      { role: "user", content: "You are given the text of a lecture. Divide this text in segment that would correspond to each presentation slides you would build for this lecture. For each segment, create the transcript of what you would tell the students will teaching the segment. Your output should be a JSON file containing only one key/value pair. The key is 'transcripts' and the value is an array that contains all the previously created transcripts as strings. Your output should only contain the JSON file. You should make sure the JSON file structure is valid and you should correct it if it's not" },
      { role: "user", content: "The given text of the lecture is: #{text}" },
    ] })

  p response.dig("data", 0, "url")
  response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo-0125",
      response_format: { "type": "json_object" },
      messages: [
        { role: "system", content: "You are a very outgoing and charismatic teacher that excels in giving clear and entertaining lecture to a classroom."},
        { role: "user", content: "You are given the text of a lecture. Divide this text in segment that would correspond to each presentation slides you would build for this lecture. For each segment, create the transcript of what you would tell the students will teaching the segment. Your output should be a JSON file containing only one key/value pair. The key is 'transcripts' and the value is an array that contains all the previously created transcripts as strings. Your output should only contain the JSON file. You should make sure the JSON file structure is valid and you should correct it if it's not" },
        { role: "user", content: "The given text of the lecture is: #{text}" },
      ],    })
  p raw_result = response.dig("choices", 0, "message", "content")
  p result = JSON.parse(raw_result)
  result["transcripts"]
end