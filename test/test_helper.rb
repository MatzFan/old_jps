# frozen_string_literal: true

require 'database_cleaner'
require 'minitest/autorun'

RACK_ENV = 'test' unless defined?(RACK_ENV)

require_relative '../app'

DONT_CLEAN = %w[parishes].freeze
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
end

def test_planning_app
  PlanningApp.new(app_ref: 'P/2018/9999', app_category: 'P',
                  app_status: 'Pending', app_officer: 'Joe Bloggs',
                  app_applicant: 'John', app_description: 'build',
                  app_address: 'Flat 1', app_road: 'Acacia Avenue',
                  app_parish: 'Trinity', app_postcode: 'JE1 1AB',
                  app_constraints: 'Green Zone, Airport',
                  app_agent: 'A.N. Agent')
end
