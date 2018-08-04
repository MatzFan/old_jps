# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish'

class ParishTest < JpsTest
  def setup
    super
    Parish.create(number: 13, name: 'St. Elsewhere')
    @parish = Parish.first
  end

  def teardown
    super
    Parish[13].delete
  end

  def test_save
    assert @parish
  end
end
