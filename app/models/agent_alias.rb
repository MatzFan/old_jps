# frozen_string_literal: true

# planning_app category
class AgentAlias < Sequel::Model
  unrestrict_primary_key
  one_to_many :planning_apps, key: :app_agent
end
