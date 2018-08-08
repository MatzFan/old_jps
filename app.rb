# frozen_string_literal: true

require 'bundler'
Bundler.require

require 'sinatra/base'
require 'haml'

# require 'better_errors'
require_relative 'config/database'
require_relative 'config/mail'

require_relative 'app/routes/base'
Dir["#{__dir__}/app/routes/*.rb"].each { |f| require_relative f }
Dir.glob('./app/{models}/*.rb').each { |file| require file }
Dir.glob('./lib/**/*.rb').each { |file| require file }

module Jps
  # the app
  class App < Sinatra::Application
    set :server, :puma
    set :database, -> { DB } # set in config/database
    set :sessions, httponly: true,
                   secure:   false,
                   secret:   ENV['JPS_SESSION_SECRET']
    use Jps::Routes::Base
    use Jps::Routes::Home
    use Jps::Routes::Contact
    use Jps::Routes::UserRoutes
    use Jps::Routes::Session
    use Jps::Routes::Applications
  end
end
