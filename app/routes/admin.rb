# frozen_string_literal: true

require_relative '../helpers/admin_helper'

module Jps
  module Routes
    # the Admin portal
    class Admin < Base
      # before redirect here leads to circular redirects everywhere!
      get '/agents' do
        redirect('/login') unless signed_in? && current_user.admin
        build_agent_jfsc_table
        haml :agents
      end

      put '/agent/link' do
        redirect('/login') unless signed_in? && current_user.admin
        agent = Agent.new(ag_domicile: dom, ag_type: type, ag_name: name, ag_reg: reg)
        AgentAlias.add_agent agent
      end
    end
  end
end
