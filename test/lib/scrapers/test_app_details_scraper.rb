# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/scrapers/app_details_scraper'

class AppDetailsScraperTest < Minitest::Test
  def self.details_hash
    { app_ref: 'RW/2014/0548', app_category: 'RW', app_status: 'Upheld',
      app_officer: 'Richard Greig', app_applicant: 'Mr & Mrs R.I.G. Hardcastle',
      app_description: 'Replace 5 No. windows on South elevation..... '\
        'REQUEST FOR RECONSIDERATION for refusal of planning permission.',
      app_house: 'Homewood', app_road: 'Le Mont Sohier',
      app_parish: 'St. Brelade', app_postcode: 'JE3 8EA',
      app_constraints: 'Built-Up Area, Green Backdrop Zone, Potential Listed '\
        'Building, Primary Route Network', app_agent: nil, # no agent here
      latitude: 49.185511, longitude: -2.191882 }
  end

  def self.dates_hash
    { date_valid: Date.parse('2014-04-04'),
      date_advertised: Date.parse('2014-04-15'),
      date_end_pub: Date.parse('2014-05-06'),
      date_site_visit: nil, # no site visit date in this example
      date_committee: Date.parse('2014-08-15'),
      date_decision: Date.parse('2014-10-14'),
      date_appeal: Date.parse('2014-07-10') }
  end

  def self.data_hash
    details_hash.merge dates_hash
  end

  def self.scraper
    @scraper ||= AppDetailsScraper.new(['RW/2014/0548', 'A/bad/app_ref'])
  end

  def test_new
    assert_instance_of AppDetailsScraper, self.class.scraper
  end

  def test_data
    data = self.class.scraper.data
    assert_instance_of Array, data
    assert_equal 2, data.size
    assert_equal({}, data[1]) # duff refs give an empty hash
    assert_equal self.class.data_hash, data[0]
  end
end
