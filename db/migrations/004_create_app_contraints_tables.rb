# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table :policy_sources do
      String :name, primary_key: true, on_update: :cascade
    end

    create_table :policies do
      primary_key :id
      foreign_key :source, :policy_sources, type: String
      String :policy_code
      String :policy_name
      String :link
    end

    create_table :constraints do
      foreign_key :policy_id, :policies
      String :con_name, primary_key: true, on_update: :cascade
    end

    create_table :applications_constraints do # alphabetical & plural
      foreign_key :name, :constraints, null: false, type: String
      foreign_key :app_ref, :applications, null: false, type: String
      primary_key %i[name app_ref]
      index %i[name app_ref]
    end
  end
end
