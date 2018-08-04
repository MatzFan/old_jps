# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish_alias'

class ParishAliasTest < JpsTest
  def setup
    super
    ParishAlias.create(name: 'St Mary')
    @alias = ParishAlias.first
  end

  def test_save
    assert @alias
  end

  def parish
    assert_equal 'St. Mary', @alias.parish.name
  end
end
