# frozen_string_literal: true

require 'database_cleaner'
require 'minitest/autorun'

RACK_ENV = 'test' unless defined?(RACK_ENV)

require_relative '../app'

DONT_CLEAN = %w[].freeze
DatabaseCleaner.strategy = :truncation, { except: DONT_CLEAN }
DatabaseCleaner.clean_with(:truncation, except: DONT_CLEAN)

Pony.override_options = { via: :test }

class JpsTest < Minitest::Test
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def create_test_user
    User.create name: 'joe', email: 'joe@m.com', password: 'pass'
  end

  def create_admin_user
    User.create name: 'a', email: 'a@m.com', password: 'pass', admin: true
  end

  def create_test_planning_app
    Application.create(app_ref: 'P/2018/9999', app_category: 'P',
                       app_status: 'Pending', app_officer: 'Joe Bloggs',
                       app_applicant: 'John', app_description: 'build',
                       app_address: 'Flat 1', app_road: 'An Avenue',
                       app_parish: 'Trinity/St. John', app_postcode: 'JE1 1AB',
                       app_constraints: 'Green Zone, Airport',
                       app_agent: 'A.N. Agent')
  end
end
