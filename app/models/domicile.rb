# frozen_string_literal: true

# domicile
class Domicile < Sequel::Model
  unrestrict_primary_key
  one_to_many :agents, key: :ag_domicile
end
