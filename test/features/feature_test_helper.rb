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

  def login_user(user)
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'pass' # HARD CODED
    click_button 'Sign in'
  end

  # def logout_user
  #   visit '/'
  #   click_button 'Logout'
  # end
end
