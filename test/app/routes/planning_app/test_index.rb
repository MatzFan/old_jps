# frozen_string_literal: true

require_relative '../routes_test_helper'

class PlanningAppIndexTest < Minitest::Test
  include Capybara::DSL

  def test_applications_index
    assert page_under_test.has_content? 'a planning app'
  end
end
