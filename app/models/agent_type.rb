# frozen_string_literal: true

# agent types
class AgentType < Sequel::Model
  unrestrict_primary_key
  one_to_many :agents, key: :ag_type
end
