# frozen_string_literal: true

require_relative '../../app'

namespace :apps do
  desc 'Get new apps for [year] (default: current year) and start_page \
    (default: 1). Start page of -1 gets all apps for the year'
  task :new, %i[year start_page] => :environment do |_t, args|
    args.with_defaults(year: Time.now.year, start_page: 1)
    t = Time.now
    scraped = AppRefsScraper.new(args.year.to_i, args.start_page.to_i).refs
    in_db = Application.where(app_ref: scraped).select_map(:app_ref)
    app_data = AppDetailsScraper.new(scraped - in_db).data # filter first
    DB.transaction { app_data.each { |hash| Application.create(hash) } }
    puts "#{app_data.count} new apps added in #{(Time.now - t).to_i / 60} mins}"
  end
end
