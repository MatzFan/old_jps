# frozen_string_literal: true

require_relative '../../test_helper'
require 'scrapers/app_refs_scraper'

class AppRefsScraperTest < Minitest::Test
  def self.refs_from_page_146
    @refs = %w[P/2013/0024 RP/2013/0010 P/2013/0015 P/2013/0014 P/2013/0011
               P/2013/0004 P/2013/0003 P/2013/0002 P/2013/0001 RW/2012/1741
               P/2012/1744 P/2012/1743 P/2012/1742 P/2012/1740 P/2012/1737
               A/2012/1739]
  end

  def self.scraper
    @scraper ||= AppRefsScraper.new(2013, 146)
  end

  def test_new
    assert_instance_of AppRefsScraper, self.class.scraper
  end

  def test_num_apps
    assert_equal 1466, self.class.scraper.num_apps
  end

  def test_num_pages
    assert_equal 147, self.class.scraper.num_pages
  end

  def test_refs_from_page_146
    assert_equal self.class.refs_from_page_146, self.class.scraper.refs
  end
end
