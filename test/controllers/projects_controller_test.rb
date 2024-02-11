require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
    @project = projects(:removable)
  end

  test "admin should get index" do
    get projects_url
    assert_response :success
  end

  test "admin should get new" do
    get new_project_url
    assert_response :success
  end

  test "admin should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project:
        { name: "test_progetto_creato_da_test", description: "test" }
      }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "admin should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "admin should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "admin should update project" do
    patch project_url(@project), params: { project: { description: @project.description, name: @project.name } }
    assert_redirected_to project_url(@project)
  end

  test "admin should destroy project" do
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end

  # Testing standard user
  test "standard should not get index" do
    log_in_as_standard
    get projects_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get new" do
    log_in_as_standard
    get new_project_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not create project" do
    log_in_as_standard
    post projects_url, params: { project:
      { name: "test_progetto_creato_da_test", description: "test" }
    }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not show project" do
    log_in_as_standard
    get project_url(@project)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get edit" do
    log_in_as_standard
    get edit_project_url(@project)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not update project" do
    log_in_as_standard
    patch project_url(@project), params: { project: { description: @project.description, name: @project.name } }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not destroy project" do
    log_in_as_standard
    delete project_url(@project)
    assert flash[:error] = "You must be admin in to access this section!"
  end

end
