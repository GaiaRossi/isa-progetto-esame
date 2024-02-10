require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @project = projects(:two)
    @task = tasks(:one)
    login_as_standard
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Tasks"
  end

  test "should create task" do
    visit tasks_url
    click_on "New task"

    fill_in "Name", with: "Task creato da system test"
    fill_in "Description", with: "Questo è un task creato da system test"
    select @project.name, :from => "task_project_id"

    click_on "Create Task"

    assert_text "Task was successfully created"
  end

  test "should update Task" do
    visit task_url(@task)
    click_on "Edit this task", match: :first

    fill_in "Name", with: "Task modificato da system test"

    click_on "Update Task"

    assert_text "Task was successfully updated"
  end

  test "should destroy Task" do
    visit task_url(@task)
    click_on "Destroy this task", match: :first

    assert_text "Task was successfully destroyed"
  end
end
