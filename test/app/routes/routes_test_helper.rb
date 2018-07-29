# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../../test_helper'

require 'rack/test'
require 'capybara'
require 'capybara/minitest'
require 'capybara/dsl'

Capybara.app = Jps::App

def page_under_test
  visit "/#{caller[0..0].first[/in `(.*)'/, 1].split('_')[1..-1].join('/')}"
  page
end
