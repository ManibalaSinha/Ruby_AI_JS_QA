# backend/setup_db.rb
require 'yaml'
require 'fileutils'
require 'sqlite3'
require 'active_record'

# Use File.expand_path to get path relative to the script
db_config_path = File.expand_path('../../config/database.yml', __FILE__)
db_config = YAML.load_file(db_config_path, aliases: true)

ActiveRecord::Base.establish_connection(db_config['development'])

# Example: create tables
ActiveRecord::Schema.define do
  create_table :test_results, if_not_exists: true do |t|
    t.string :name
    t.string :status
    t.timestamps
  end
end

puts "Database initialized!"
