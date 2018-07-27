# frozen_string_literal: true

module Jps
  module Routes
    # the app
    class Page < Base
      set :server, :puma

      get '/' do
        haml :layout
      end
    end
  end
end
