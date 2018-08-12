# frozen_string_literal: true

Sequel.migration do
  change do
    create_view(:agents_and_aliases, DB[:agent_aliases]
      .left_join(:applications, app_agent: :name)
      .order(:name)
      .where(agent_id: nil)
      .select_group(:name)
      .select_append { count(:name).as(:count) }
      .order(:count).reverse)
  end
end
