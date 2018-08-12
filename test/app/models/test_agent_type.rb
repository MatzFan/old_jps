# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/agent_type'

class AgentTypeTest < JpsTest
  def setup
    super
    AgentType.create(type: 'Individual')
  end

  def test_save
    assert_equal 1, AgentType.count
  end
end
