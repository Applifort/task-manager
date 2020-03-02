
ENV['RAILS_ENV'] ||= 'test'
require 'coveralls'
require 'simplecov'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter,
]

SimpleCov.start 'rails'

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include AuthHelper
end

module SignInHelper
  def sign_in_as(admin)
    post session_path, params: {
      session: {
        password: admin.password,
        email: admin.email
      }
    }
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end


