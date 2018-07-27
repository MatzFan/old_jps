# frozen_string_literal: true

module Jps
  module Routes
    # base for all routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, File.expand_path('../../', __dir__)
      end
    end
  end
end
