require "test_helper"

class AdminDashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
  end

  test "admin should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end

  test "standard should not get index" do
    log_in_as_standard
    get admin_dashboard_index_url
    assert flash[:error] = "You must be admin in to access this section!"
  end
end
