require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_standard
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task:
        { name: "test task creato da test", description: @task.description, project_id: @task.project_id, is_completed: false }
      }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { description: "cambio descrizione" } }
    assert_redirected_to task_url(@task)
    assert flash[:notice] = "Task was successfully updated."
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
    assert flash[:notice] = "Task was successfully destroyed."
  end
end
