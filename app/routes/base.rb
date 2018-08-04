# frozen_string_literal: true

require_relative '../helpers/sessions_helper'

module Jps
  module Routes
    # base for all routes
    class Base < Sinatra::Application
      set :session_secret, ENV['JPS_SESSION_SECRET']
      enable :sessions

      configure do
        set :server, :puma
        set :views, 'app/views'
      end
    end
  end
end
