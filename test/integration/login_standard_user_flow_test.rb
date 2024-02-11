require "test_helper"

class LoginStandardUserFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:standard)
  end

  test "can see login page" do
    get new_user_session_url
    assert_select "h1", "Login page"
  end

  test "can login as standard" do
    post user_sessions_url, params: {
      user: { username: @user.username, password: "test_password_standard" }
    }
    follow_redirect!
    assert_select "p", "Login success!"
  end
end
