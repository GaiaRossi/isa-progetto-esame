require "test_helper"
require "selenium-webdriver"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Selenium Driver
  driven_by :selenium, using: :headless_chrome do |driver_option|
    driver_option.add_argument("headless=new")
    driver_option.add_argument("disable-gpu")
    driver_option.add_argument("no-sandbox")
  end
end
