# frozen_string_literal: true

require_relative '../../app/models/parish'

namespace :db do
  desc 'Seeds DB with parish data <environment>'
  task :seed do
    ARGV.each { |a| task a.to_sym }
    original_verbose = $VERBOSE
    $VERBOSE = nil # suppress warning of re-define of constants
    if (e = ARGV[1]) # environment
      abort("Bad env: #{e}") unless %w[test development production].include? e
      RACK_ENV = e
    end
    load File.expand_path('config/database.rb') # reload so DB set per RACK_ENV
    $VERBOSE = original_verbose # Activate warning messages again
    Parish::NAMES.each_with_index.map do |name, i|
      DB[:parishes].insert number: i + 1, name: name
    end
  end
end
