# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class Index < Base
      get '/applications/index' do
        haml :index
      end

      get '/applications/data.json' do
        apps = PlanningApp.order(:order).reverse.select_map(PlanningApp::TABLE_COLS)
        puts apps.inspect
        { columns: PlanningApp::TABLE_TITLES.map do |t|
          { title: t }
        end, app_data: apps }.to_json
      end
    end
  end
end
