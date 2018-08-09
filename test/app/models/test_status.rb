# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/status'

class StatusTest < JpsTest
  def setup
    super
    Status.create(name: 'pending')
  end

  def test_save
    assert_equal 1, Status.count
  end
end
