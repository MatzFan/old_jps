# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/parish_alias'

class ParishAliasTest < JpsTest
  def setup
    super
    @alias = ParishAlias.new(name: 'New Parish')
  end

  def test_save
    @alias.save
    assert_equal 1, ParishAlias.count
  end

  def parish
    parish_alias = @alias.save
    assert_equal 'New Parish', parish_alias.parish.name
  end
end
