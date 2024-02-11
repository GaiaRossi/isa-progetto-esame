require "test_helper"

class SeeAdminDashboardFlowTest < ActionDispatch::IntegrationTest
  setup do
    log_in_as_admin
  end

  test "can see dashobard" do
    get admin_dashboard_index_url
    assert_select "h1", "Hello, " + users(:admin).username
  end
end
