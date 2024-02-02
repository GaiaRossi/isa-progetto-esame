require "test_helper"

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_session_url
    assert_response :success
  end

  test "should log in" do
    post user_sessions_url, params: {
      user: { username: users(:admin).username, password: "test_password_admin" }
    }
    assert flash[:notice] = "Login success!"
    assert_redirected_to projects_url
  end
end
