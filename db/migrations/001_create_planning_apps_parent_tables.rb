# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table :parishes do
      String :name, primary_key: true
    end

    create_table :parish_strings do
      String :string, primary_key: true
    end

    create_table :parish_strings_parishes do
      foreign_key :par_name, :parishes, type: String
      foreign_key :par_string, :parish_strings, type: String
    end

    create_table :categories do
      String :code, primary_key: true
      String :name
    end

    create_table :statuses do
      String :name, primary_key: true
    end

    create_table :officers do
      String :name, primary_key: true
    end
  end
end
