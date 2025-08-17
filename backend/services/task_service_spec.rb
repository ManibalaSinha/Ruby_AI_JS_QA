require 'spec_helper'
require_relative '../../services/task_service'

RSpec.describe TaskService do
  let(:project) { Project.create(name: 'Demo Project') }

  it "creates, updates, finds, and deletes a task" do
    task = TaskService.create(name: 'Test Task', project_id: project.id)
    expect(task).not_to be_nil
    expect(TaskService.find(task.id).name).to eq('Test Task')

    TaskService.update(task.id, name: 'Updated Task')
    expect(TaskService.find(task.id).name).to eq('Updated Task')

    TaskService.delete(task.id)
    expect(TaskService.find(task.id)).to be_nil
  end
end
