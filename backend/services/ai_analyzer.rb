# backend/services/ai_analyzer.rb
class AIAnalyzer
  # Mock AI analysis
  def self.analyze(test_result)
    # Example: if status is "failed" and details mention "timeout", AI could suggest retry
    suggestion = if test_result.status == "failed" && test_result.details.include?("timeout")
                   "Consider increasing timeout or optimizing test steps."
                 else
                   "No immediate action required."
                 end
    { test_result_id: test_result.id, suggestion: suggestion }
  end
end
