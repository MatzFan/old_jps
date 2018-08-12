# frozen_string_literal: true

# application category
class AgentAlias < Sequel::Model
  unrestrict_primary_key
  one_to_many :applications, key: :app_agent
  many_to_one :agent
end
