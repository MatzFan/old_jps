# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../lib/scrapers/jfsc_registry_scraper'

class JfscRegistryScraperTest < Minitest::Test
  def setup
    @row1 = { Number: '91091',
              Type: 'RC',
              Name: 'TRINITY JOINERY (2005) LIMITED',
              Registered: '02 Sep 2005' }
    @row2 = { Number: '22331',
              Type: 'RBN',
              Name: 'TRINITY JOINERY',
              Registered: '20 Sep 2005' }
    @results = [@row1, @row2]
  end

  def self.text_scraper
    @text_scraper ||= JfscRegistryScraper.new(text: 'trinity joinery')
  end

  def self.reg_scraper
    @reg_scraper ||= JfscRegistryScraper.new(reg: 91_091)
  end

  def test_new
    assert_instance_of JfscRegistryScraper, self.class.text_scraper
  end

  def test_new_with_bad_args
    assert_raises(ArgumentError) { JfscRegistryScraper.new('bad arg') }
  end

  def test_results_text
    assert_equal @results, self.class.text_scraper.results
  end

  def test_results_reg
    assert_equal [@row1], self.class.reg_scraper.results # 2D array
  end

  def test_results_rows
    assert_equal 2, self.class.text_scraper.send(:results_rows).size
  end

  def test_verify_table_headers
    assert self.class.text_scraper.send(:verify_table_headers)
  end
end
