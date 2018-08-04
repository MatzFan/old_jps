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
