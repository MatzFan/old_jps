# frozen_string_literal: true

require_relative '../../test_helper'
require 'scrapers/app_scraper'

class AppScraperTest < Minitest::Test
  def setup
    @scraper = AppScraper.new
    super
  end

  def test_new
    assert_equal AppScraper, @scraper.class
  end

  def test_latest_app_num
    
  end
end
