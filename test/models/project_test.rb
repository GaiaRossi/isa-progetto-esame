require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test 'valid project' do
    project = Project.new(name: 'progetto', description: 'descrizione progetto')
    assert project.valid?
  end

  test 'invalid without name' do
    project = Project.new(description: 'descrizione progetto')
    refute project.valid?, 'project is valid without name'
  end
end
