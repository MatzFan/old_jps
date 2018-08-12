# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/application'

class ApplicationTest < JpsTest
  def setup
    super
    create_test_planning_app # helper method
    @app = Application.first
  end

  def test_save
    assert_equal 1, Application.count
  end

  def test_status
    assert_equal 'Pending', @app.status.name
  end

  def test_category
    assert_equal 'P', @app.category.code
  end

  def test_officer
    assert_equal 'Joe Bloggs', @app.officer.name
  end

  def test_parishes
    assert_equal %w[Trinity St.\ John], @app.parishes
  end

  def test_agent_alias
    assert_equal 'A.N. Agent', @app.agent_alias.name
  end

  def test_app_address
    assert_equal 'An Avenue<br>Trinity/St. John<br>JE1 1AB', @app.app_address
  end

  def test_app_constraints
    assert_equal 'Airport<br>Green Zone', @app.app_constraints
  end

  def test_constraints
    assert_equal %w[Airport Green\ Zone], @app.constraints.map(&:con_name).sort
  end

  def test_latest_app_num_for_2018
    assert_equal 9999, Application.latest_app_num_for(2018)
  end

  def test_latest_app_num_for_2032
    assert_nil Application.latest_app_num_for(2032) # no apps
  end
end
