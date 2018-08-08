# frozen_string_literal: true

Sequel.migration do
  change do
    create_view(
      :applications_table,
      DB[:constraints_planning_apps].natural_join(:planning_apps)
    )
  end
end
