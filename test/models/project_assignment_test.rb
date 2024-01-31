require "test_helper"

class ProjectAssignmentTest < ActiveSupport::TestCase
  test 'valid project assignment' do
    user = User.create(username: 'utente1', is_admin: false, password: 'test_password_utente1')
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    project_assignment = ProjectAssignment.new(project_id: project.id, user_id: user.id)
    assert project_assignment.valid?
  end

  test 'valid project assignment same project' do
    user = User.create(username: 'utente1', is_admin: false, password: 'test_password_utente1')
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    project1 = Project.create(name: 'progetto1', description: 'descrizione progetto1')
    project_assignment = ProjectAssignment.create(project_id: project.id, user_id: user.id)
    project_assignment1 = ProjectAssignment.new(project_id: project1.id, user_id: user.id)
    assert project_assignment1.valid?
  end

  test 'invalid with incorrect user_id' do
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    project_assignment = ProjectAssignment.new(project_id: project.id, user_id: -1)
    refute project_assignment.valid?, 'project assignment created with incorrect user_id'
  end

  test 'invalid with incorrect project_id' do
    user = User.create(username: 'utente1', is_admin: false, password: 'test_password_utente1')
    project_assignment = ProjectAssignment.new(project_id: -1, user_id: user.id)
    refute project_assignment.valid?, 'project assignment created with incorrect project_id'
  end

  test 'invalid if assignment already made' do
    user = User.create(username: 'utente1', is_admin: false, password: 'test_password_utente1')
    project = Project.create(name: 'progetto', description: 'descrizione progetto')
    project_assignment = ProjectAssignment.create(project_id: project.id, user_id: user.id)
    project_assignment_dup = ProjectAssignment.new(project_id: project.id, user_id: user.id)
    refute project_assignment_dup.valid?, 'project assignment with assignment already made'
  end
end
