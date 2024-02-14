require "test_helper"

class ProjectTest < ActiveSupport::TestCase

  setup do
    @project_assigned = projects(:one)
    @project_not_assigned = projects(:two)
    @user = users(:removable)
  end

  test 'valid project' do
    project = Project.new(name: 'progetto', description: 'descrizione progetto')
    assert project.valid?
  end

  test 'invalid without name' do
    project = Project.new(description: 'descrizione progetto')
    refute project.valid?, 'project is valid without name'
  end

  test 'invalid if name already taken' do
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    project_dup = Project.create(name: 'progetto', description: 'descrizione progetto')
    refute project_dup.valid?, 'project is created with same name'
  end

  test 'correct assigned_to scope' do
    project_a = Project.create(id: @project_assigned.id, name: @project_assigned.name, description: @project_assigned.description)
    project_na = Project.create(id: @project_not_assigned.id, name: @project_not_assigned.name, description: @project_not_assigned.description)
    user = User.create(id: @user.id, username: @user.username, is_admin: @user.is_admin, password_digest: @user.password_digest)
    project_assignment = ProjectAssignment.create(user_id: @user.id, project_id: project_a.id)

    scope_resp = Project.assigned_to(user)
    assert_includes scope_resp, project_a
  end
end
