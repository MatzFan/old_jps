# frozen_string_literal: true

# application constraint
class Constraint < Sequel::Model
  unrestrict_primary_key
  one_to_many :application_constraints, key: :con_name
  many_to_many :applications, left_key: :con_name, right_key: :app_ref
end
