require 'simplecov'
SimpleCov.start if ENV['COVERAGE']

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'wrong'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include Wrong
end
