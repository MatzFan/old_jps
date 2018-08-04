# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/constraint'

class ConstraintTest < JpsTest
  def setup
    super
    Constraint.create(name: 'Green Zone')
    @constraint = Constraint.first
  end

  def test_save
    assert @constraint
  end
end
