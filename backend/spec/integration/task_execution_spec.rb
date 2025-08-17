require 'spec_helper'
require_relative '../../services/task_execution_service'
require_relative '../../models/task'
require_relative '../../models/project'
require_relative '../../models/user'

RSpec.describe TaskExecutionService do
  let(:user)    { User.create!(name: "Alice", email: "alice@example.com") }
  let(:project) { Project.create!(name: "QA System", user_id: user.id) }
  let(:task)    { Task.create!(name: "Run RSpec suite", project_id: project.id) }

  it "executes a task and stores a test result" do
    result = TaskExecutionService.run(task.id)

    expect(result).to be_a(TestResult)
    expect(result.task_id).to eq(task.id)
    expect(%w[passed failed]).to include(result.status)
    expect(result.details).to be_a(String)
  end
end
