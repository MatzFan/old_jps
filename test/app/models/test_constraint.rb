# frozen_string_literal: true

require_relative '../../test_helper'
require 'app/models/constraint'

class ConstraintTest < Minitest::Test
  def setup
    Constraint.create(name: 'Green Zone')
    @constraint = Constraint.first
  end

  def test_save
    assert @constraint
  end
end
