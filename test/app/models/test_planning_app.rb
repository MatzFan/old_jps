# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/planning_app'

class PlanningAppTest < JpsTest
  def setup
    super
    create_test_planning_app # helper method
    @app = PlanningApp.first
  end

  def test_save
    assert_equal 1, PlanningApp.count
  end

  def test_parents
    %w[category status officer parish_alias agent_alias].each do |str|
      klass = Module.const_get(str.split('_').map(&:capitalize).join)
      assert_instance_of klass, @app.send(str.to_sym)
    end
  end

  def test_app_address
    assert_equal 'Acacia Avenue<br>Trinity<br>JE1 1AB', @app.app_address
  end

  def test_constraints_list
    assert_equal %w[Airport Green\ Zone], @app.constraints_list
  end

  def test_app_constraints
    assert_equal 'Airport<br>Green Zone', @app.app_constraints
  end

  def test_constraints
    assert_equal %w[Airport Green\ Zone], @app.constraints.map(&:name).sort
  end
end
