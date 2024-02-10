ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def log_in_as_admin
      post user_sessions_url, params: {
        user: { username: users(:admin).username, password: "test_password_admin" }
      }
    end

    def log_in_as_standard
      post user_sessions_url, params: {
        user: { username: users(:standard).username, password: "test_password_standard" }
      }
    end
  end
end
