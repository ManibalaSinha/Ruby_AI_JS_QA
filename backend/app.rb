require 'sinatra'
require 'sinatra/json'
require 'sequel'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require './models/test_result'
require './services/ai_test_generator'
require './routes/api'

set :database, {adapter: "sqlite3", database: "qa_tests.db"}
set :port, 4567
set :bind, '0.0.0.0'

DB = Sequel.sqlite('qa_tests.db')
# Ensure test_results table exists
DB.create_table? :test_results do
  primary_key :id
  String :test_name
  String :status
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
  data = JSON.parse(request.body.read)
  results.insert(test_name: data["test_name"], status: data["status"])
  json message: "Result saved!"
end
# Run Sinatra app
run Sinatra::Application.run!
