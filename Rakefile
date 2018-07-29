# frozen_string_literal: true

require 'rake/testtask'
require_relative 'config/database'
load 'tasks/db/migrate.rake'

# only load other tasks (which may use models) if DB is set up by above
# Dir.glob('./tasks/**/*.rake').each { |r| load r } unless DB.tables.empty?

# Rake::TestTask.new do |t|
#   # t.libs << 'test' # t.libs = ['lib']
#   t.test_files = FileList['test/**/test_*.rb']
#   t.verbose = true
# end
# desc 'Run tests'

# task default: :test
