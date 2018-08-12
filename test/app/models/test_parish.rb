# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish'

class ParishTest < JpsTest
  def setup
    super
    Parish.create(name: 'St. Elsewhere')
  end

  def test_save
    assert_equal 1, Parish.count
  end
end
