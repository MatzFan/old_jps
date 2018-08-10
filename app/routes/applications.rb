# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class Applications < Base
      before { redirect('/login') unless signed_in? }

      get '/applications/index' do
        haml :index
      end

      get '/applications/data.json' do
        apps = PlanningApp.order(:order).reverse.select_map(PlanningApp::TABLE_COLS)
        { columns: PlanningApp::TABLE_TITLES.map do |t|
          { title: t }
        end, app_data: apps, lov_titles: PlanningApp::TABLE_LOVS, constraints: Constraint.select_order_map(:name) }.to_json
      end

      get '/applications/map' do
        haml :map
      end
    end
  end
end
