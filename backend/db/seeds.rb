User.create(name: "Alice", email: "alice@example.com")
Project.create(name: "QA Automation", user_id: 1)
Task.create(name: "Write RSpec tests", project_id: 1)
TestResult.create(task_id: 1, status: "passed")
