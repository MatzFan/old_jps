# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/category'

class CategoryTest < Minitest::Test
  def setup
    Category.create(code: 'P')
    @category = Category.first
  end

  def test_save
    assert @category
  end
end
