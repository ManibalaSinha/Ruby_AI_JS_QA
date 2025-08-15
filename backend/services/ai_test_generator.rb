require 'rest-client'
require 'json'

class AITestGenerator
  OPENAI_API_KEY = ENV['OPENAI_API_KEY']

  def self.generate_tests(url)
    prompt = "Generate automated QA test cases for this website: #{url}"
    response = RestClient.post "https://api.openai.com/v1/completions",
      { model: "text-davinci-003", prompt: prompt, max_tokens: 300 }.to_json,
      { Authorization: "Bearer #{OPENAI_API_KEY}", content_type: :json, accept: :json }
    
    JSON.parse(response.body)["choices"][0]["text"]
  end
end
