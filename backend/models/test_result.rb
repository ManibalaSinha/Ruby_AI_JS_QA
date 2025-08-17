# backend/models/test_result.rb
require 'active_record'
require 'sqlite3'
require 'sequel'

# Connect to the SQLite database
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'db/development.sqlite3'
)

class TestResult < ActiveRecord::Base
end



