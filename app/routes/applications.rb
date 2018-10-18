# frozen_string_literal: true

module Jps
  module Routes
    # the Contact page
    class Applications < Base
      before do
        redirect('/login') unless signed_in?
      end

      get '/applications/index' do
        haml :index
      end

      get '/applications/data.json' do
        apps = Application.order(:order).reverse.select_map(Application::TABLE_COLS)
        columns = Application::TABLE_TITLES.map { |t| { title: t } }
        json = { columns: columns,
          app_data: apps,
          lov_titles: Application::TABLE_LOVS,
          constraints: Constraint.select_order_map(:con_name),
          parishes: Parish.select_order_map(:name) }.to_json
        puts json
        json
      end

      get '/applications/map' do
        haml :map
      end
    end
  end
end
