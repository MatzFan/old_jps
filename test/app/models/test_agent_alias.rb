# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/agent_alias'

class AgentAliasTest < JpsTest
  def setup
    super
    AgentAlias.create(name: 'A.N. Agent')
    @alias = AgentAlias.first
  end

  def test_save
    assert @alias
  end
end
