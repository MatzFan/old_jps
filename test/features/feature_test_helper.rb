# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../test_helper'

require 'rack/test'
require 'capybara'
require 'capybara/minitest'
require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist # phantomjs dep
Capybara.app = Jps::App

class CapybaraTestCase < JpsTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def setup
    super
  end

  def teardown
    super
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
