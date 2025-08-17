#!/usr/bin/env ruby
require_relative '../config/database'
require_relative '../services/task_execution_service'

if ARGV.empty?
  puts "Usage: ruby bin/run_task.rb <task_id>"
  exit(1)
end

task_id = ARGV[0].to_i

begin
  result = TaskExecutionService.run(task_id)
  puts "Execution finished: #{result.status} - #{result.details}"
rescue => e
  puts "Error: #{e.message}"
end
