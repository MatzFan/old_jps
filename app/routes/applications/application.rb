# frozen_string_literal: true

require 'config/mail' # MailConfig namespace

module Jps
  module Routes
    # base for all routes
    class Application < Base
      configure do
        set :views, 'app/views/applications'
      end
    end
  end
end
