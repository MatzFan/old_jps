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

  def teardown
    Capybara.reset_sessions! # will logout test user
    super
    Capybara.use_default_driver
  end

  def create_test_user
    User.create name: 'joe', email: 'joe@m.com', password: 'pass'
  end

  def login_test_user
    visit '/login'
    fill_in 'email', with: 'joe@m.com'
    fill_in 'password', with: 'pass'
    click_button 'Sign in'
  end

  def logout_test_user
    visit '/'
    click_button 'Logout'
  end
end
