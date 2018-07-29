# frozen_string_literal: true

require 'database_cleaner'
require 'minitest/autorun'

RACK_ENV = 'test' unless defined?(RACK_ENV)

require_relative '../app'

DONT_CLEAN = %w[].freeze
DatabaseCleaner.strategy = :truncation, { except: DONT_CLEAN }
DatabaseCleaner.clean_with(:truncation, except: DONT_CLEAN)

module Minitest
  class Test
    def setup
      DatabaseCleaner.start
      super
    end

    def teardown
      DatabaseCleaner.clean
      super
    end
  end
end
