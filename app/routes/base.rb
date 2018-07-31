# frozen_string_literal: true

require_relative '../../config/mail' # MailConfig namespace

module Jps
  module Routes
    # base for all routes
    class Base < Sinatra::Application
      configure do
        set :server, :puma
        set :sessions, true
        set :views, 'app/views'
        # set :root, File.expand_path('../../', __dir__)
        set :mail_options, MailConfig.mail_options
      end
    end
  end
end
