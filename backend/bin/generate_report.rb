# backend/bin/generate_report.rb
require_relative '../config/database'
require_relative '../services/test_result_service'
require_relative '../services/ai_analyzer'
# Require models
require_relative '../models/test_result'

Database.connect 

TestResult.all.each do |tr|
  report = AIAnalyzer.analyze(tr)
  puts "TestResult #{tr.id}: #{tr.status} -> Suggestion: #{report[:suggestion]}"
end
