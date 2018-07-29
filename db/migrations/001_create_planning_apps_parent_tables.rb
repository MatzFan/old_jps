# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table(:parishes) do
      Integer :number, primary_key: true, auto_increment: false
      String :name, null: false
    end

    create_table(:categories) do
      String :code, primary_key: true
      String :name
    end

    create_table(:statuses) do
      String :name, primary_key: true
    end

    create_table(:officers) do
      String :name, primary_key: true
    end

    create_table(:parish_aliases) do
      String :name, primary_key: true
      foreign_key :parish_num, :parishes, type: Integer
    end

    create_table(:agent_aliases) do
      String :name, primary_key: true
    end
  end
end
