require 'bundler'

Bundler.require
# $LOAD_PATH << File.expand_path(__dir__)

require 'sinatra/base'

# the web app
class App < Sinatra::Application
  get '/' do
    'Hello World!'
  end
end
