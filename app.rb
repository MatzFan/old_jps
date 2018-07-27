# frozen_string_literal: true

require 'bundler'
require 'bootstrap'
require 'haml'
require 'sinatra/base'

Bundler.require
# $LOAD_PATH << File.expand_path(__dir__)

# the app
class App < Sinatra::Application
  set :server, :puma

  get '/' do
    haml :layout
  end
end
