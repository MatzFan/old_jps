# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish_alias'

class ParishAliasTest < JpsTest
  def setup
    super
    ParishAlias.create(name: 'New Parish')
  end

  def test_save
    assert_equal 1, ParishAlias.count
  end

  def parish
    assert_equal 'New Parish', ParishAlias.first.parish.name
  end
end
