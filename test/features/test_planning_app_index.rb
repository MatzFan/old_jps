# frozen_string_literal: true

require_relative 'feature_test_helper'

class PlanningAppIndexTest < CapybaraTestCase
  def setup
    super
    Capybara.current_driver = Capybara.javascript_driver
    test_user.save
    test_planning_app.save
  end

  def test_applications_index_redirect_to_login
    visit '/applications/index'
    assert_current_path '/login'
  end

  def test_applications_index_for_logged_in_user
    login_test_user
    visit '/applications/index'
    assert page.has_content? 'Reference' # in table title
    assert page.has_content? 'P/2018/9999' # in table body
  end
end
