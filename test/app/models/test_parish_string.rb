# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish_string'

class ParishStringTest < JpsTest
  def setup
    super
    ParishString.create(string: 'St. Lawrence/St. Mary')
    @string = ParishString.first
  end

  def test_save
    assert_equal 1, ParishString.count
  end

  def test_parishes
    assert_equal %w[St.\ Lawrence St.\ Mary], @string.parishes.map(&:name)
  end
end
