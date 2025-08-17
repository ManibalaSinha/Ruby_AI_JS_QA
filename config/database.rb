# backend/config/database.rb
require 'active_record'
require 'fileutils'

module Database
  def self.config
    db_path = File.expand_path('../db/development.sqlite3', __dir__)
    FileUtils.mkdir_p(File.dirname(db_path)) unless Dir.exist?(File.dirname(db_path))

    {
      adapter: 'sqlite3',
      database: db_path
    }
  end

  def self.connect
    ActiveRecord::Base.establish_connection(config)
  end
end