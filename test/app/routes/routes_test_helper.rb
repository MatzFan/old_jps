# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require_relative '../../../app'

require 'rack/test'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/minitest'
require 'capybara/dsl'

Capybara.app = Jps::App

def page_under_test
  visit "/#{caller[0..0].first[/in `(.*)'/, 1].split('_')[1]}"
  page
end
