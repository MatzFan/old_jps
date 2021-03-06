# frozen_string_literal: true

require_relative 'feature_test_helper'
require_relative '../../lib/scrapers/app_details_scraper'

class UserLoginTest < CapybaraTestCase
  def setup
    super
    create_test_user
  end

  def test_user_login_redirects_to_applications_index
    login_user User.first
    assert_current_path '/applications/index'
  end
end
