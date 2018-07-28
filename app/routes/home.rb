# frozen_string_literal: true

module Jps
  module Routes
    # the app
    class Home < Base
      get '/' do
        haml :home
      end
    end
  end
end
