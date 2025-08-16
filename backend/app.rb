require 'sinatra'
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

get '/' do
  "AI Web QA Backend Running"
end
get '/hello' do
  json message: "Hello QA Engineer "
end
get '/results' do
  json results.all
end

post '/results' do
  halt 415, json(error: 'Use application/json') unless request.media_type == 'application/json'
  payload = JSON.parse(request.body.read) rescue nil
  halt 400, json(error: 'Invalid JSON') unless payload

  name   = payload['test_name']&.strip
  status = payload['status']&.strip
  halt 422, json(error: 'test_name and status are required') if name.to_s.empty? || status.to_s.empty?

  id = RESULTS.insert(test_name: name, status: status)
  json message: 'Result saved!', id: id
end

# Run Sinatra app only if this file is executed directly
Sinatra::Application.run! if __FILE__ == $0

