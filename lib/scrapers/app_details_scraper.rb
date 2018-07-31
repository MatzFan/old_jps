# frozen_string_literal: true

require 'mechanize'

# Scrapes application details
class AppDetailsScraper
  MIS = 'Application number is missing from the request or was not found'
  ROOT = 'https://www.gov.je/citizen/Planning/Pages/'
  DETAILS_PAGE = 'PlanningApplicationDetail.aspx?s=1&r='
  DATES_PAGE = 'PlanningApplicationTimeline.aspx?s=1&r='
  CSS = ".//table[@class='pln-searchd-table']"
  TT = '_table_titles'
  ID_DELIM = 'ctl00_lbl'
  COORDS = %i[Latitude Longitude].freeze
  LAT = 48.6 # minimum value for valid coords

  DETAILS_TABLE_TITLES = %w[Reference Category Status Officer Applicant
                            Description ApplicationAddress RoadName Parish
                            PostCode Constraints Agent].freeze

  DETAILS_FIELDS = %i[app_ref app_category app_status app_officer app_applicant
                      app_description app_house app_road app_parish
                      app_postcode app_constraints app_agent].freeze

  DATES_TABLE_TITLES = %w[ValidDate AdvertisedDate endpublicityDate
                          SitevisitDate CommitteeDate Decisiondate
                          Appealdate].freeze

  DATES_FIELDS = %i[date_valid date_advertised date_end_pub date_site_visit
                    date_committee date_decision date_appeal].freeze

  attr_reader :agent, :app_refs, :num_refs, :det_pages, :dat_pages

  def initialize(*app_refs)
    @agent = Mechanize.new
    @app_refs = app_refs.flatten
    @num_refs = @app_refs.length
    @det_pages = pages('DETAILS_PAGE').map(&validate)
    @dat_pages = pages('DATES_PAGE').map(&validate)
    raise unless correct_number_of_pages?
  end

  def data
    (0...num_refs).map { |i| det_pages[i] && dat_pages[i] ? data_hash(i) : {} }
  end

  private

  def validate
    proc { |page| page unless page.body.include? MIS } # invalid pages => nil's
  end

  def correct_number_of_pages?
    num_refs == det_pages.size && num_refs == dat_pages.size
  end

  def pages(type)
    app_refs.map { |ref| agent.get(ROOT + self.class.const_get(type) + ref) }
  end

  def app_details(int)
    table_ok?(int, 'details') ? details(int) : {}
  end

  def details(int)
    (0..1).map { |n| det_table(int, n).map { |e| get_text(e) } }.flatten
  end

  def get_text(element)
    element.text.empty? ? nil : element.text.strip.squeeze(' ') # repeat spaces
  end

  def details_hash(int)
    Hash[DETAILS_FIELDS.zip app_details(int)]
  end

  def app_dates(int)
    table_ok?(int, 'dates') ? dates_table(int).map { |e| datify(e.text) } : {}
  end

  def datify(string)
    string == 'n/a' ? nil : Date.parse(string).to_date
  end

  def dates_hash(int)
    Hash[DATES_FIELDS.zip(app_dates(int))]
  end

  def data_hash(int)
    details_hash(int).merge(coords_hash(int)).merge(dates_hash(int))
  end

  def err(int, type)
    "Bad #{type} table structure for #{app_refs[int]}"
  end

  def table_ok?(int, type)
    send((type + TT).to_s, int) != const(type) ? (raise err(int, type)) : true
  end

  def const(type)
    self.class.const_get((type + TT).upcase.to_s)
  end

  def det_table(int, num)
    det_pages[int].search(CSS)[num].css('tr').css('td').css('span')
  end

  def dates_table(int)
    dat_pages[int].search(CSS).css('tr').css('td').css('span')
  end

  def details_table_titles(int)
    (0..1).map { |n| det_table(int, n).map { |e| parse(e.attr('id')) } }.flatten
  end

  def dates_table_titles(int)
    dates_table(int).map { |e| parse(e.attr('id')) }
  end

  def parse(text)
    text.split(ID_DELIM).last
  end

  def coords(int)
    COORDS.map { |coord| parse_coord(det_pages[int].body, coord.to_s).to_f }
  end

  def coords_hash(int)
    coords(int)[0] > LAT ? Hash[COORDS.map(&:downcase).zip(coords(int))] : {}
  end

  def parse_coord(source, coord)
    source.split('window.MapCentre' + coord + ' = ').last.split(';').first
  end
end
