# backend/models/test_result.rb
require 'sqlite3'
require 'sequel'

DB = Sequel.connect('sqlite://db/test_results.db')

DB.create_table? :test_results do
  primary_key :id
  String :test_name
  String :status
  String :details
  DateTime :created_at
end

class TestResult < Sequel::Model
end
