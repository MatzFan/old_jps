# frozen_string_literal: true

module Jps
  module Routes
    module Applications
      # the Contact page
      class Index < Application
        get '/applications/index' do
          haml :index
        end
      end
    end
  end
end
