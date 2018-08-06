# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish'

class ParishTest < JpsTest
  def setup
    super
    @parish = Parish.new(number: 13, name: 'St. Elsewhere')
  end

  def teardown
    super
    Parish[13].delete
  end

  def test_save
    @parish.save
    assert_equal 13, Parish.count
  end
end
