# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/agent_alias'

class AgentAliasTest < JpsTest
  def setup
    super
    @alias = AgentAlias.new(name: 'A.N. Agent')
  end

  def test_save
    @alias.save
    assert_equal 1, AgentAlias.count
  end
end
