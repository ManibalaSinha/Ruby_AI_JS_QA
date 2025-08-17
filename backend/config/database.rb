require 'active_record'
require 'sqlite3'

module Database
  def self.config
    {
      adapter:  'sqlite3',
      database: File.expand_path('../db/development.sqlite3', __dir__)
    }
  end

  def self.connect
    ActiveRecord::Base.establish_connection(config)
  end
end
