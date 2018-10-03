# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/agent'

class AgentTest < JpsTest
  def setup
    super
    Agent.create(ag_name: 'A.N. Agent',
                 ag_domicile: 'Jersey',
                 ag_type: 'Entity',
                 ag_reg: '12345')
    @agent = Agent.first
  end

  def test_save
    assert_equal 1, Agent.count
  end

  def test_domicile
    assert_equal 'Jersey', @agent.domicile.name
  end

  def test_agent_type
    assert_equal 'Entity', @agent.agent_type.type
  end

  def test_add_agent_alias
    @agent.add_agent_alias(name: 'A N Agent')
    assert_equal 'A N Agent', @agent.agent_aliases.first.name
  end
end
