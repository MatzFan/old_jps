# frozen_string_literal: true

namespace :db do
  desc 'Migrate DB [to version] <environment>'
  task :migrate, [:version] do |_t, args|
    version = (v = args[:version]) ? v.to_i : nil
    ARGV.each { |a| task a.to_sym }
    original_verbose = $VERBOSE
    $VERBOSE = nil # suppress warning of re-define of constants
    if (e = ARGV[1]) # environment
      abort("Bad env: #{e}") unless %w[test development production].include? e
      RACK_ENV = e
    end
    load File.expand_path('config/database.rb') # reload so DB set per RACK_ENV
    $VERBOSE = original_verbose # Activate warning messages again.
    db_name = "jps_#{RACK_ENV}"
    if version
      if RACK_ENV != 'test' && version.zero?
        puts 'Migrating to 0 may DESTROY DATA - proceed (Y/n)'
        abort('Migration aborted') unless STDIN.gets.chomp == 'Y'
      end
      puts "Migrating '#{db_name}' to version #{version}"
      Sequel::Migrator.run(DB, 'db/migrations', target: version)
    else
      puts "Migrating '#{db_name}' to latest"
      Sequel::Migrator.run(DB, 'db/migrations')
    end
  end
end
