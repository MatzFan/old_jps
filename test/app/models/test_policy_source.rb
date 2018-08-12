# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/policy_source'

class PolicySourceTest < JpsTest
  def setup
    super
    PolicySource.create(name: 'Island Plan 2011')
  end

  def test_save
    assert_equal 1, PolicySource.count
  end
end
