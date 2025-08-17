# services/task_execution_service.rb
require_relative '../models/task'
require_relative '../models/test_result'

class TaskExecutionService
  def self.run(task_id)
    task = Task.find(task_id)
    raise "Task not found" unless task

    puts "Running task: #{task.name}"

    # Simulate test execution
    passed = [true, false].sample
    details = passed ? "All tests passed " : "Some tests failed "

    result = TestResult.create!(
      task_id: task.id,
      status: passed ? "passed" : "failed",
      details: details
    )

    puts "Test Result: #{result.status.upcase}"
    result
  end
end
