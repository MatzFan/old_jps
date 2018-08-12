# frozen_string_literal: true

# application constraint
class Constraint < Sequel::Model
  unrestrict_primary_key
  one_to_many :application_constraints, key: :name
  many_to_many :applications, left_key: :name, right_key: :app_ref
end
