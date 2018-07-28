# frozen_string_literal: true

require 'config/mail' # MailConfig namespace

module Jps
  module Routes
    # base for all routes
    class Base < Sinatra::Application
      configure do
        set :server, :puma
        set :views, 'app/views'
        set :root, File.expand_path('../../', __dir__)
        set :mail_options, MailConfig.mail_options
        set :foo, 'bar'
      end
    end
  end
end