# backend/config/logger.rb
require 'logger'
LOG = Logger.new($stdout)
LOG.level = Logger::INFO
