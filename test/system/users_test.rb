require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:admin)
    visit new_user_session_url
    fill_in "Username", with: @user.username
    fill_in "Password", with: "test_password_admin"
    click_on "Login"
    assert_selector "h1", text: "Projects"
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  # test "should create user" do
  #   visit users_url
  #   click_on "New user"

  #   click_on "Create User"

  #   assert_text "User was successfully created"
  #   click_on "Back"
  # end

  # test "should update User" do
  #   visit user_url(@user)
  #   click_on "Edit this user", match: :third

  #   click_on "Update User"

  #   assert_text "User was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy User" do
  #   visit user_url(@user)
  #   click_on "Destroy this user", match: :third

  #   assert_text "User was successfully destroyed"
  # end
end
