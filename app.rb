# frozen_string_literal: true

require 'bundler'
Bundler.require
$LOAD_PATH << File.expand_path(__dir__)
$LOAD_PATH << File.expand_path('lib', __dir__)

require 'sinatra/base'
require 'haml'
require_relative 'config/database'

require 'app/routes/base'
Dir["#{__dir__}/app/routes/*.rb"].each { |f| require f }

require 'app/routes/applications/application'
Dir["#{__dir__}/app/routes/applications/*.rb"].each { |f| require f }

module Jps
  # the app
  class App < Sinatra::Application
    set :database, -> { DB } # set in config/database
    Dir.glob('./app/{models}/*.rb').each { |file| require file } # needed?
    Dir.glob('./lib/**/*.rb').each { |file| require file } # needed?

    use Jps::Routes::Base
    use Jps::Routes::Home
    use Jps::Routes::Contact
    use Jps::Routes::Applications::Index
  end
end
