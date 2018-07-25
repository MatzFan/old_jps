ENV['RACK_ENV'] = 'test'

require_relative '../app'

require 'rack/test'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/minitest'
require 'capybara/dsl'

Capybara.app = App
