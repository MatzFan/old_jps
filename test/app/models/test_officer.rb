# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/officer'

class OfficerTest < JpsTest
  def setup
    super
    Officer.create(name: 'Joe Bloggs')
  end

  def test_save
    assert_equal 1, Officer.count
  end
end
