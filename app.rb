# frozen_string_literal: true

require 'bundler'
Bundler.require
$LOAD_PATH << File.expand_path(__dir__)

require 'haml'
require 'sinatra/base'

# relies on base.rb dependency being first alphabetically
Dir[File.join(__dir__, 'app', 'routes', '*.rb')].sort.each { |f| require f }

# the app

module Jps
  # the app
  class App < Sinatra::Application
    use Jps::Routes::Base
    use Jps::Routes::Home
    use Jps::Routes::Contact
  end
end
