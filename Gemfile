# frozen_string_literal: true

ruby '2.5.1'
source 'https://rubygems.org'

gem 'bcrypt', '3.1.12'
gem 'haml', '5.0.4'
gem 'mechanize', '2.7.6'
# gem 'oj', '3.6.5'
gem 'parallel', '1.12.1'
gem 'pony', '1.12'
gem 'puma', '3.12.0'
gem 'rake', '12.3.1'
gem 'sequel', '5.10.0'
gem 'sequel_pg', '1.11.0', require: 'sequel' # faster C adapter
gem 'sinatra', '2.0.3', require: 'sinatra/base'

group :test do
  gem 'capybara', '3.4.2'
  gem 'database_cleaner', '1.7.0'
  gem 'minitest', '5.11.3'
  gem 'poltergeist', '1.18.1' # phantomjs 2.1.1 dep
  gem 'rack-test', '1.1.0'
end

group :development do
  gem 'guard', '2.14.2'
  gem 'guard-minitest', '2.4.6'
  gem 'libnotify', '0.9.4'
  gem 'rubocop', '0.58.2'
  gem 'shotgun', '0.9.2'
end
