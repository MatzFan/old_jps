# frozen_string_literal: true

module Jps
  module Routes
    # the Admin portal
    class Admin < Base
      # before redirect here leads to circular redirects everywhere!
      get '/agents' do
        redirect('/login') unless signed_in? && current_user.admin
        titles = %i[name count]
        @titles = titles.map(&:capitalize)
        @data = DB[:agents_and_aliases].select_map titles
        haml :agents
      end
    end
  end
end
