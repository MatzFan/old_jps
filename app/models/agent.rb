# frozen_string_literal: true

# application agent
class Agent < Sequel::Model
  one_to_many :agent_aliases, key: :agent_id
  many_to_one :domicile, key: :ag_domicile
  many_to_one :agent_type, key: :ag_type

  def before_save
    DB.transaction do
      Domicile.find_or_create(name: ag_domicile) if ag_domicile
      AgentType.find_or_create(type: ag_type) if ag_type
    end
    super
  end
end
