# frozen_string_literal: true

require 'bundler'
Bundler.require

require 'sinatra/base'
require 'haml'
require_relative 'config/database'

require_relative 'app/routes/base'
Dir["#{__dir__}/app/routes/*.rb"].each { |f| require_relative f }

module Jps
  # the app
  class App < Sinatra::Application
    set :database, -> { DB } # set in config/database
    Dir.glob('./app/{models}/*.rb').each { |file| require file } # needed?
    Dir.glob('./lib/**/*.rb').each { |file| require file } # needed?

    use Jps::Routes::Base
    use Jps::Routes::Home
    use Jps::Routes::Contact
    use Jps::Routes::Index
  end
end
