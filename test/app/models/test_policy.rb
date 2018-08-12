# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/policy'

class PolicyTest < JpsTest
  def setup
    super
    Policy.create(source: 'Z', policy_name: 'a', policy_code: 'b', link: 'c')
  end

  def test_save
    assert_equal 1, Policy.count
  end
end
