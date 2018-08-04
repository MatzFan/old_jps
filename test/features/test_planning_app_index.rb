# frozen_string_literal: true

require_relative 'feature_test_helper'

class PlanningAppIndexTest < CapybaraTestCase
  def setup
    Capybara.current_driver = Capybara.javascript_driver
  end

  def test_applications_index_for_logged_in_user
    # page.set_rack_session(current_user: 1)
    visit '/applications/index'
    assert page.has_content? 'Reference'
  end
end
