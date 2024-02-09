require "test_helper"

class AdminDashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
  end

  test "should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end
end
