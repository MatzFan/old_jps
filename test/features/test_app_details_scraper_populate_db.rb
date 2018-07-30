# frozen_string_literal: true

require_relative '../test_helper'
require 'scrapers/app_details_scraper'

class AppDetialsScraperTest < Minitest::Test
  def setup
    PlanningApp.create AppDetailsScraper.new('RW/2014/0548').data.first
  end

  def test_populate_db
    assert_instance_of PlanningApp, PlanningApp.first
  end
end
