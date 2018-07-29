# frozen_string_literal: tue

Sequel.migration do
  change do
    create_table :planning_apps do
      String :app_ref, primary_key: true
      # String :app_code
      # Integer :app_year
      # Integer :app_number
      foreign_key :app_agent, :agent_aliases, type: String
      foreign_key :app_category, :categories, type: String
      foreign_key :app_officer, :officers, type: String
      foreign_key :app_status, :statuses, type: String
      foreign_key :app_parish, :parish_aliases, type: String
      String :app_applicant
      String :app_address
      String :app_constraints
      String :app_description
      String :app_postcode
      String :app_road
      Float :latitude
      Float :longitude
      Date :date_valid
      Date :date_advertised
      Date :date_end_pub
      Date :date_site_visit
      Date :date_committee
      Date :date_decision
      Date :date_appeal
      # Integer :order, unique: true # removed unique constraint in migration 18
    end
  end
end
