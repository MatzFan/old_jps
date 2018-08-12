# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :users do
      primary_key :id
      String :name, null: false
      String :email, null: false, unique: true
      String :password_hash, null: false
      String :confirmation_code
      FalseClass :confirmation, null: false, default: false
      String :authenticity_token
      String :password_reset_token
      DateTime :password_reset_sent_date
      FalseClass :admin, null: false, default: false
    end
  end
end
