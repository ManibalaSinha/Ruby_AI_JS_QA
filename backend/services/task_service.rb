# backend/services/task_service.rb
require_relative '../models/task'
require_relative '../models/project'
require_relative '../models/test_result'

class TaskService
  def self.all
    Task.all
  end

  def self.find(id)
    Task.find_by(id: id)
  end

  def self.create(attrs)
    Task.create(attrs)
  end

  def self.update(id, attrs)
    task = Task.find_by(id: id)
    return nil unless task
    task.update(attrs)
    task
  end

  def self.delete(id)
    task = Task.find_by(id: id)
    task.destroy if task
  end
end
