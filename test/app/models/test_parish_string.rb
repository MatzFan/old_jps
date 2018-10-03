# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish_string'

class ParishStringTest < JpsTest
  def setup
    super
    @string = ParishString.create(string: 'St. Lawrence/St. Mary')
    @bad_string = ParishString.create(string: 'St. Lawrence / St Mary')
  end

  def test_save
    assert_equal 2, ParishString.count
  end

  def test_multiple_parishes
    assert_equal %w[St.\ Lawrence St.\ Mary], @string.parishes.map(&:name)
  end

  def test_multiple_misspelt_parishes
    assert_equal %w[St.\ Lawrence St.\ Mary], @bad_string.parishes.map(&:name)
  end
end
