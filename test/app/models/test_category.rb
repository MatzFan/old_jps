# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/category'

class CategoryTest < JpsTest
  def setup
    super
    @category = Category.new(code: 'Z')
  end

  def test_save
    @category.save
    assert_equal 1, Category.count
  end
end
