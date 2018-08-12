# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table :domiciles do
      String :name, primary_key: true, on_update: :cascade
    end

    create_table :agent_types do
      String :type, primary_key: true, on_update: :cascade
    end

    create_table :agents do
      primary_key :id
      foreign_key :ag_domicile, :domiciles, type: String
      foreign_key :ag_type, :agent_types, type: String
      String :ag_name
      String :ag_reg
    end

    create_table :agent_aliases do
      String :name, primary_key: true
      foreign_key :agent_id, :agents
    end
  end
end
