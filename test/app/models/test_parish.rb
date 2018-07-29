# frozen_string_literal: true

require_relative '../../test_helper'
require 'app/models/parish'

class ParishTest < Minitest::Test
  def setup
    Parish.create(number: 1, name: 'Trinity')
    @parish = Parish.first
  end

  def test_save
    assert @parish
  end
end
