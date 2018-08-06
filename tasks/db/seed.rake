# frozen_string_literal: true

namespace :db do
  desc 'Seeds DB with parish data <environment>'
  task :seed, :environment do
    original_verbose = $VERBOSE
    $VERBOSE = nil # suppress warning of re-define of constants
    load File.expand_path('config/database.rb') # reload so DB set per RACK_ENV
    $VERBOSE = original_verbose # Activate warning messages again
    Parish::NAMES.each_with_index.map do |name, i|
      DB[:parishes].insert number: i + 1, name: name
    end
    puts "Seeded database jps_#{RACK_ENV}"
  end
end
