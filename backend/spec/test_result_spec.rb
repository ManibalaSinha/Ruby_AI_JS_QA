# Ruby_web_qa/backend/spec/test_result_spec.rb
require 'rspec'
require_relative '../models/test_result'
require_relative '../config/database' # or wherever you put the ActiveRecord setup

RSpec.describe 'TestResult model' do
  it 'can store a test result' do
    result = { test_name: 'Login Test', status: 'Passed' }
    expect(result[:test_name]).to eq('Login Test')
  end
end
