# frozen_string_literal: true

require_relative 'feature_test_helper'

class AdminPageTest < CapybaraTestCase
  def setup
    super
    @user = create_test_user
    @admin = create_admin_user
  end

  def test_agents_redirect_to_login
    visit '/agents'
    assert_current_path '/login'
  end

  def test_agents_redirect_to_login_for_normal_user
    login_user @user
    visit '/agents'
    assert_current_path '/login'
  end

  def test_agents_success_for_admin_user
    login_user @admin
    visit '/agents'
    assert_current_path '/agents'
  end
end
