# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/planning_app'

class PlanningAppTest < JpsTest
  def setup
    super
    @app = PlanningApp.new(app_ref: 'P/2018/9999', app_category: 'P',
                           app_status: 'Pending', app_officer: 'Joe Bloggs',
                           app_applicant: 'John', app_description: 'build',
                           app_address: 'Flat 1', app_road: 'Acacia Avenue',
                           app_parish: 'Trinity', app_postcode: 'JE1 1AB',
                           app_constraints: 'Green Zone, Airport',
                           app_agent: 'A.N. Agent')
  end

  def test_save
    @app.save
    assert_equal 1, PlanningApp.count
  end

  def test_parents
    app = @app.save
    %w[category status officer parish_alias agent_alias].each do |str|
      klass = Module.const_get(str.split('_').map(&:capitalize).join)
      assert_instance_of klass, app.send(str.to_sym)
    end
  end

  def test_constraints
    app = @app.save
    assert_equal %w[Airport Green\ Zone], app.constraints.map(&:name).sort
  end
end
