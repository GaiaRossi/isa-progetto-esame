require "test_helper"

class TaskTest < ActiveSupport::TestCase

  setup do
    @project = projects(:two)
    @user = users(:standard)
  end

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
    task = Task.create(name: 'task', description: 'descrizione task', project_id: project.id)
    task_dup = Task.create(name: 'task', description: 'descrizione task', project_id: project.id)
    refute task_dup.valid?, 'task created with name already taken'
  end

  test 'invalid if project is missing' do
    task = Task.new(name: 'task', description: 'descrizione task', project_id: -1)
    refute task.valid?, 'task created with incorrect project reference'
  end

  test 'correct visible_to scope' do
    task_assigned = Task.create(name: "task assigned", description: "descrizione", project_id: @project.id)
    task_not_assigned = Task.create(name: "task not assigned", description: "descrizione not assigned", project_id: projects(:one).id)

    scope_resp = Task.visible_to(@user)
    assert_includes scope_resp, task_assigned
  end
end
