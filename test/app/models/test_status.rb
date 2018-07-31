# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/status'

class StatusTest < Minitest::Test
  def setup
    Status.create(name: 'pending')
    @status = Status.new
  end

  def test_save
    assert @status
  end
end
