# frozen_string_literal: true

require_relative '../../lib/scrapers/app_refs_scraper'
require_relative '../../lib/scrapers/app_details_scraper'

namespace :apps do
  desc 'Get new apps for [year] (default: current year) and start_page \
    (default: 1). Start page of -1 gets all apps for the year'
  task :new, %i[year start_page] => :environment do |_t, args|
    # args.with_defaults(year: Time.now.year, start_page: 1)
    # scraped = AppRefsScraper.new(args.year, args.start_page).refs
    # in_db = PlanningApp.where(app_ref: scraped).select_map(:app_ref)
    # app_data = AppDetailsScraper.new(scraped - in_db).data # filter first
    # DB.transaction do
    #   app_data.each { |hash| PlanningApp.create(hash) }
    # end
    # puts "#{app_data.count} new applications added"
  end
end
