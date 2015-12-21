ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require "authlogic/test_case"
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    include FactoryGirl::Syntax::Methods
    include Capybara::DSL
    include Authlogic::TestCase
  # Add more helper methods to be used by all tests here...
end
