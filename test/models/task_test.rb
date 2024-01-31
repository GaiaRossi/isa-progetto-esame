require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test 'valid task' do
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    task = Task.new(name: 'task', description: 'descrizione task', project_id: project.id)
    assert task.valid?
  end

  test 'invalid without name' do
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    task = Task.new(description: 'descrizione task', project_id: project.id)
    refute task.valid?, 'task created without name'
  end

  test 'invalid if name already taken' do
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    task = Task.new(name: 'task', description: 'descrizione task', project_id: project.id)
    task_dup = Task.new(name: 'task', description: 'descrizione task', project_id: project.id)
    refute task_dup.valid?, 'task created with name already taken'
  end

  test 'invalid if project is missing' do
    task = Task.new(name: 'task', description: 'descrizione task', project_id: -1)
    refute task.valid?, 'task created with incorrect project reference'
  end
end
