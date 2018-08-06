# frozen_string_literal: true

require_relative '../helpers/sessions_helper'

module Jps
  module Routes
    # base for all routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
      end
    end
  end
end
