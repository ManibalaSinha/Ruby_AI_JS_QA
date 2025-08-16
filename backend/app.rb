require 'sinatra'
require 'sinatra/json'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require './models/test_result'
require './services/ai_test_generator'
require './routes/api'

set :database, {adapter: "sqlite3", database: "qa_tests.db"}
set :port, 4567
set :bind, '0.0.0.0'

get '/' do
  "AI Web QA Backend Running"
end

# Run Sinatra app
run Sinatra::Application.run!
