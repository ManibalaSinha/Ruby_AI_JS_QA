# backend/routes/api.rb
require 'sinatra/namespace'

namespace '/api' do
  get '/results' do
    results = TestResult.all
    json results
  end

  post '/results' do
    data = JSON.parse(request.body.read)
    TestResult.create(
      test_name: data['test_name'],
      status: data['status'],
      details: data['details'],
      created_at: Time.now
    )
    json message: "Result saved"
  end
end
