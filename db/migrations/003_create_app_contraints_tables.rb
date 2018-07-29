# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table(:constraints) do
      String :name, primary_key: true
    end

    create_table(:constraints_planning_apps) do # alphabetical & plural
      foreign_key :name, :constraints, null: false, type: String
      foreign_key :app_ref, :planning_apps, null: false, type: String
      primary_key %i[name app_ref]
      index %i[name app_ref]
    end
  end
end
