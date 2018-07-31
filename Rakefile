# frozen_string_literal: true

require 'rake/testtask'
require_relative 'config/database'

mig = './tasks/db/migrate.rake'
load mig

other_tasks = Dir.glob('./tasks/**/*.rake') - Dir[mig]
latest = Dir['./db/migrations/*'].max.split('_').first.split('/').last.to_i

begin
  migrated = DB[:schema_info].first[:version].to_i == latest
rescue Sequel::DatabaseError
  migrated = false
end

other_tasks.each { |r| load r } if migrated

# Rake::TestTask.new do |t|
#   # t.libs << 'test' # t.libs = ['lib']
#   t.test_files = FileList['test/**/test_*.rb']
#   t.verbose = true
# end
# desc 'Run tests'

# task default: :test
