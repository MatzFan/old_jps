# frozen_string_literal: true

require_relative 'routes_test_helper'

class HomeTest < Minitest::Test
  include Capybara::DSL

  def test_home
    visit '/'
    assert page.has_content? 'jerseypropertyservices.com'
  end
end
