# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/domicile'

class DomicileTest < JpsTest
  def setup
    super
    Domicile.create(name: 'Jersey')
  end

  def test_save
    assert_equal 1, Domicile.count
  end
end
