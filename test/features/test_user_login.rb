# frozen_string_literal: true

require_relative 'feature_test_helper'
require_relative '../../lib/scrapers/app_details_scraper'

class UserLoginTest < CapybaraTestCase
  def setup
    super
    User.create name: 'Joe', email: 'joe@mail.com', password: 'pass'
  end

  def test_user_login
    visit '/login'
    assert true
  end
end
