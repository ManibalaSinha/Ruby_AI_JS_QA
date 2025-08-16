# backend/services/ai_test_generator.rb
require 'net/http'
require 'json'

class AiTestGenerator
  API_URL = "https://api.openai.com/v1/chat/completions"
  API_KEY = ENV['OPENAI_API_KEY']

  def self.generate_test_cases(description)
    uri = URI(API_URL)
    req = Net::HTTP::Post.new(uri, {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{API_KEY}"
    })
    req.body = {
      model: "gpt-4",
      messages: [
        { role: "system", content: "You are a QA test case generator." },
        { role: "user", content: "Generate JavaScript unit tests for: #{description}" }
      ]
    }.to_json

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(req) }
    JSON.parse(res.body)["choices"][0]["message"]["content"]
  end
end
