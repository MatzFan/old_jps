# frozen_string_literal: true

require 'mechanize'

# Scrapes application details
class JfscRegistryScraper
  URL = 'https://www.jerseyfsc.org/registry/documentsearch/NameSearch.aspx'
  NAME_FIELD = 'ctl00$Main$txtSearch'
  REG_FIELD = 'ctl00$Main$txtRegNo'
  RES_TABLE = 'table#Main_ResultsGrid'
  TABLE_HEADERS = %w[Number Type Name Date\ Registered].freeze
  KEYS = %i[Number Type Name Registered].freeze

  attr_reader :agent

  def initialize(args)
    raise ArgumentError unless args.is_a? Hash
    @text = args[:text]
    @reg = args[:reg]
    @agent = Mechanize.new
    @form = form1
    @results_table = results_table
  end

  def results
    results_rows.map { |row| parse_row(row) }
  end

  private

  def parse_row(row)
    Hash[KEYS.zip row.css('td').map(&:text)]
  end

  def results_rows
    raise unless verify_table_headers
    @results_table.css('tbody tr')
  end

  def verify_table_headers
    @results_table.css('thead tr th').map(&:text) == TABLE_HEADERS
  end

  def results_table
    search.at_css RES_TABLE
  end

  def search
    @form[NAME_FIELD] = @text
    @form[REG_FIELD] = @reg
    @form.submit
  end

  def form1
    page.form_with(id: 'form1')
  end

  def page
    agent.get(URL)
  end
end
