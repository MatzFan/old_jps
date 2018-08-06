# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/constraint'

class ConstraintTest < JpsTest
  def setup
    super
    @constraint = Constraint.new(name: 'New Constraint')
  end

  def test_save
    @constraint.save
    assert_equal 1, Constraint.count
  end
end
