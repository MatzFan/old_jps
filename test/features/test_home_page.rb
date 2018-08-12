# frozen_string_literal: true

require_relative 'feature_test_helper'

class HomePageTest < CapybaraTestCase
  def setup
    super
    @user = create_test_user
  end

  def test_navbar_links
    visit '/'
    assert_link 'Applications'
    assert_link 'Map'
    assert_link 'Contact'
    assert_link 'Login'
    assert_link 'Register'
  end

  def test_logged_in_user_navbar_links
    login_user @user
    visit '/'
    assert_link 'Edit profile'
    assert_link 'Logout'
  end
end
