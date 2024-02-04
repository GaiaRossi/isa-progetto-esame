require "application_system_test_case"

class ProjectAssignmentsTest < ApplicationSystemTestCase
  setup do
    @project_assignment = project_assignments(:one)
    login_as_admin
  end

  test "visiting the index" do
    visit project_assignments_url
    assert_selector "h1", text: "Project assignments"
  end

  test "should create project assignment" do
    visit project_assignments_url
    click_on "New project assignment"

    select "Progetto rimovibile test", :from => "project_assignment_project_id"
    select "test_user", :from => "project_assignment_user_id"
    click_on "Create Project assignment"

    assert_text "Project assignment was successfully created"
    click_on "Back"
  end

  test "should update Project assignment" do
    visit project_assignment_url(@project_assignment)
    click_on "Edit this project assignment", match: :first

    select "test_standard_user", :from => "project_assignment_user_id"
    click_on "Update Project assignment"

    assert_text "Project assignment was successfully updated"
    click_on "Back"
  end

  test "should destroy Project assignment" do
    visit project_assignment_url(@project_assignment)
    click_on "Destroy this project assignment", match: :first

    assert_text "Project assignment was successfully destroyed"
  end
end
