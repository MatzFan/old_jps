# frozen_string_literal: true

require_relative 'routes_test_helper'

class HomeTest < Minitest::Test
  include Capybara::DSL

  def test_
    assert page_under_test.has_content? 'jerseypropertyservices.com'
  end

  def test_contact
    assert page_under_test.has_content? 'Your message'
  end
end
