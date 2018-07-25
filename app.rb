require 'bundler'

Bundler.require
# $LOAD_PATH << File.expand_path(__dir__)

require 'sinatra/base'

# the app
class App < Sinatra::Application
  set :server, :puma

  get '/' do
    'Hello World!'
  end
end
