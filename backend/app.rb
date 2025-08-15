require 'sinatra'
require 'sinatra/activerecord'
require './models/test_result'
require './services/ai_test_generator'
require './routes/api'

set :database, {adapter: "sqlite3", database: "qa_tests.db"}

# Run Sinatra app
run Sinatra::Application.run!
