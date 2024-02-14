require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mario)
  end

  test "should get new" do
    get new_user_session_url
    assert_response :success
  end

  test "should log in" do
    post user_sessions_url, params: {
      user: { username: @user.username, password: "mario_123" }
    }
    assert flash[:notice] = "Login success!"
    assert_redirected_to projects_url
  end

  test "should not log in" do
    post user_sessions_url, params: {
      user: { username: "", password: "" }
    }
    assert flash[:notice] = "Login failed!"
    assert_redirected_to new_user_session_url
  end
end
