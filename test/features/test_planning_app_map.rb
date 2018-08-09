# frozen_string_literal: true

require_relative 'feature_test_helper'

class PlanningAppMapTest < CapybaraTestCase
  def setup
    super
    Capybara.current_driver = Capybara.javascript_driver
    create_test_user
  end

  def test_applications_index_redirect_to_login
    visit '/applications/map'
    assert_current_path '/login'
  end

  def test_applications_index_for_logged_in_user
    login_test_user
    visit '/applications/map'
    assert_current_path '/applications/map'
  end
end
