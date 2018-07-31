# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/officer'

class OfficerTest < Minitest::Test
  def setup
    Officer.create(name: 'Joe Bloggs')
    @officer = Officer.new
  end

  def test_save
    assert @officer
  end
end
