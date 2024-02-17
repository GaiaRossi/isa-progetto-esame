require "test_helper"

class ProjectAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
    @project_assignment = project_assignments(:lucia_to_test)
  end

  test "admin should get index" do
    get project_assignments_url
    assert_response :success
  end

  test "admin should get new" do
    get new_project_assignment_url
    assert_response :success
  end

  test "admin should create project_assignment" do
    assert_difference("ProjectAssignment.count") do
      post project_assignments_url, params: { project_assignment:
        { user_id: 1 , project_id: 2 }
      }
    end

    assert_redirected_to project_assignment_url(ProjectAssignment.last)
  end

  test "admin should show project_assignment" do
    get project_assignment_url(@project_assignment)
    assert_response :success
  end

  test "admin should get edit" do
    get edit_project_assignment_url(@project_assignment)
    assert_response :success
  end

  test "admin should update project_assignment" do
    patch project_assignment_url(@project_assignment), params: { project_assignment: { user_id: 1 } }
    assert_redirected_to project_assignment_url(@project_assignment)
    assert flash[:notice] = "Project assignment was successfully updated."
  end

  test "admin should destroy project_assignment" do
    assert_difference("ProjectAssignment.count", -1) do
      delete project_assignment_url(@project_assignment)
    end

    assert_redirected_to project_assignments_url
    assert flash[:notice] = "Project assignment was successfully destroyed."
  end

  # Testing standard user

  test "standard should not get index" do
    log_in_as_standard
    get project_assignments_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get new" do
    log_in_as_standard
    get new_project_assignment_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not create project_assignment" do
    log_in_as_standard
    post project_assignments_url, params: { project_assignment:
      { user_id: 1 , project_id: 2 }
    }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not show project_assignment" do
    log_in_as_standard
    get project_assignment_url(@project_assignment)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get edit" do
    log_in_as_standard
    get edit_project_assignment_url(@project_assignment)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not update project_assignment" do
    log_in_as_standard
    patch project_assignment_url(@project_assignment), params: { project_assignment: { user_id: 1 } }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not destroy project_assignment" do
    log_in_as_standard
    delete project_assignment_url(@project_assignment)
    assert flash[:error] = "You must be admin in to access this section!"
  end

end
