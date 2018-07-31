# frozen_string_literal: true

require_relative 'routes_test_helper'

class PlanningAppIndexTest < CapybaraTestCase
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  def setup
    Capybara.current_driver = Capybara.javascript_driver
    super
  end

  def test_applications_index
    # assert page_under_test.has_css? '#tbl'
    assert page_under_test.has_content? 'Reference' # table header
  end
end
