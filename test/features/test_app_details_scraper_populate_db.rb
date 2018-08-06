# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../lib/scrapers/app_details_scraper'

# subcalss JpsTest as db impact but Capy not used
class IntegrationTest < JpsTest
  def setup
    super
    PlanningApp.create AppDetailsScraper.new('RW/2014/0548').data.first
  end

  def test_populate_db
    assert_instance_of PlanningApp, PlanningApp.first
  end
end
