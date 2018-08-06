# frozen_string_literal: true

task :environment, [:env] => 'bundler:setup' do |_cmd, args|
  ENV['RACK_ENV'] = args[:env] || 'development'
end
