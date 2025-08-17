require 'active_record'
require 'sqlite3'

# Connect to SQLite database
db_path = File.expand_path('../../db/development.sqlite3', __FILE__)
Dir.mkdir(File.expand_path('../../db', __FILE__)) unless Dir.exist?(File.expand_path('../../db', __FILE__))
File.write(db_path, '') unless File.exist?(db_path)

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: db_path
)

