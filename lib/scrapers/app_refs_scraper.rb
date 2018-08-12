# frozen_string_literal: true

# scrapes app refs for a given year
class AppRefsScraper
  ROOT = 'https://www.gov.je/'
  CURL = 'curl -s -X POST -H "Content-Type: application/json"\
          -H "Accept-Encoding: gzip" -d'
  URL = '"URL":'
  SITE = '"https://www.gov.je/citizen/Planning/Pages/Planning.aspx"'
  COMMON = '"CommonParameters":'
  SEARCH = '"SearchParameters":'
  REQ_PAGE = '_layouts/15/PlanningAjaxServices/PlanningSearch.svc/Search'
  RESULT = 'ResultHTML'
  HEADER = 'HeaderHTML'
  DETAILS_URL = 'citizen/Planning/Pages/PlanningApplicationDetail.aspx?'
  PARAMS = 's=1&amp;r='

  attr_reader :year, :num_apps, :num_pages

  def initialize(year, start_page = 1)
    raise ArgumentError, "Bad year: #{year}" unless year > 1980 && year < 2019
    raise ArgumentError, "Bad page: #{start_page}" unless start_page.positive?
    @year = year.to_s
    @num_apps = number_of_apps
    @num_pages = number_of_pages
    @start_page = start_page
    @latest_app_num = latest_app_num
  end

  def refs
    (@start_page..num_pages).inject([]) do |memo, page_num|
      refs = app_refs_on_page(page_num)
      return memo + refs if include_latest_app_ref?(refs)
      memo + refs
    end
  end

  private

  def app_refs_on_page(page)
    app_refs_array(page).map { |e| e.split('">')[0] }.uniq
  end

  def number_of_apps
    JSON.parse(json_for_page(1))[HEADER].split[8].to_i
  end

  def number_of_pages
    (num_apps / 10.0).ceil
  end

  def latest_app_num
    Application.latest_app_num_for(@year).to_s.rjust(4, '0') || '0000'
  end

  def app_refs_array(page)
    JSON.parse(json_for_page(page))[RESULT].split(delimiter)[1..-1]
  end

  def delimiter
    'href="' + ROOT + DETAILS_URL + PARAMS
  end

  def url_params
    URL + SITE
  end

  def common_params(page)
    COMMON + '"|05|' + page.to_s + '||||"'
  end

  def search_params
    SEARCH + '"|1301||||0|All|All|01|01|' + year + '|' + '31|12|' + year + '"'
  end

  def params(page)
    url_params + ',' + common_params(page) + ',' + search_params
  end

  def json_for_page(page)
    cmd = CURL + " {'" + params(page) + "}' " + ROOT + REQ_PAGE
    `#{cmd}| gunzip -`
  end

  def include_latest_app_ref?(refs)
    refs.any? { |r| r =~ %r{\/#{@year}\/#{@latest_app_num}$} }
  end
end
