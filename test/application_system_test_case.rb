require "test_helper"
require "selenium-webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Selenium Driver
  driven_by :selenium, using: :headless_chrome do |driver_option|
    driver_option.add_argument("headless=new")
    driver_option.add_argument("disable-gpu")
    driver_option.add_argument("no-sandbox")
  end

  # Funzioni che richiamo spesso
  def login_as_admin
    visit new_user_session_url
    fill_in "Username", with: "test_admin_user"
    fill_in "Password", with: "test_password_admin"
    click_on "Login"
    assert_selector "h1", text: "Projects"
  end
end
