require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
    @user = users(:removable)
  end

  test "admin should get index" do
    get users_url
    assert_response :success
  end

  test "admin should get new" do
    get new_user_url
    assert_response :success
  end

  test "admin should create user" do
    assert_difference("User.count") do
      post users_url, params: { user:
        { username: "test_user_creato_da_test", password: "test_password" }
      }
    end

    assert_redirected_to user_url(User.last)
  end

  test "admin should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "admin should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "admin should update user" do
    patch user_url(@user), params: { user: { password: "cambio_password" } }
    assert_redirected_to user_url(@user)
    assert flash[:notice] = "User was successfully updated."
  end

  test "admin should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
    assert flash[:notice] = "User was successfully destroyed."
  end

  # Testing standard user
  test "standard should not get index" do
    log_in_as_standard
    get users_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get new" do
    log_in_as_standard
    get new_user_url
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not create user" do
    log_in_as_standard
    post users_url, params: { user:
        { username: "test_user_creato_da_test", password: "test_password" }
      }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not show user" do
    log_in_as_standard
    get user_url(@user)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not get edit" do
    log_in_as_standard
    get edit_user_url(@user)
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not update user" do
    log_in_as_standard
    patch user_url(@user), params: { user: { password: "cambio_password" } }
    assert flash[:error] = "You must be admin in to access this section!"
  end

  test "standard should not destroy user" do
    log_in_as_standard
    delete user_url(@user)
    assert flash[:error] = "You must be admin in to access this section!"
  end
end
