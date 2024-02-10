require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:removable)
  end

  test "visiting the index" do
    login_as_standard
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    login_as_admin
    visit projects_url
    click_on "New project"

    fill_in "Description", with: @project.description
    fill_in "Name", with: "Progetto creato da system test"
    click_on "Create Project"

    assert_text "Project was successfully created"
  end

  test "should update Project" do
    login_as_admin
    visit project_url(@project)
    click_on "Edit this project", match: :first

    fill_in "Description", with: @project.description
    fill_in "Name", with: @project.name
    click_on "Update Project"

    assert_text "Project was successfully updated"
  end

  test "should destroy Project" do
    login_as_admin
    visit project_url(@project)
    click_on "Destroy this project", match: :first

    assert_text "Project was successfully destroyed"
  end
end
