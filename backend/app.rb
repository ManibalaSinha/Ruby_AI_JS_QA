#require 'sinatra'
require 'sinatra/json'
require 'sequel'
require 'sinatra/activerecord'
require './models/test_result'
require './services/ai_test_generator'
require './routes/api'

# app setting
set :port, 4567
set :bind, '0.0.0.0'

# database (Sequel +SQLite)
DB = Sequel.sqlite('qa_tests.db')

# Ensure test_results table exists, bootstrap schema(id,names,status, timestamps)
DB.create_table? :test_results do
  primary_key :id
  String :test_name, null: false
  String :status, null: false
  DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP
end

results = DB[:test_results]

# Always return JSON
before do
  content_type :json
end

get '/' do
  "AI Web QA Backend Running"
end
get '/hello' do
  json message: "Hello QA Engineer "
end
get '/results' do
  json results.all
end

# Example route with validation
post "/results" do
  data = JSON.parse(request.body.read) rescue nil
  halt 400, { error: "Invalid JSON" }.to_json unless data
  halt 422, { error: "Missing test_name" }.to_json unless data["test_name"]

  id = DB[:test_results].insert(data)
  { id: id }.to_json
end

# Global error handler
error do
  e = env['sinatra.error']
  status 500
  { error: "Internal Server Error", message: e.message }.to_json
end

# Run Sinatra app only if this file is executed directly
Sinatra::Application.run! if __FILE__ == $0

