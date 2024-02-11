require "test_helper"

class LoginAdminUserFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:admin)
  end

  test "can see login page" do
    get new_user_session_url
    assert_select "h1", "Login page"
  end

  test "can login as admin" do
    post user_sessions_url, params: {
      user: { username: @user.username, password: "test_password_admin" }
    }
    follow_redirect!
    assert_select "p", "Login success!"
  end
end
