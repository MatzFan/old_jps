# frozen_string_literal: true

require_relative 'feature_test_helper'
require_relative '../../lib/scrapers/app_details_scraper'

class UserRegistrationTest < CapybaraTestCase
  def test_successful_user_registration
    visit '/users/register'
    fill_in 'name', with: 'Joe'
    fill_in 'email', with: 'joe@mail.com'
    fill_in 'password', with: 'JoePasswd'
    click_button 'Register'
    assert_equal 1, User.count
  end
end
