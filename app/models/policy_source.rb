# frozen_string_literal: true

# policy source
class PolicySource < Sequel::Model
  unrestrict_primary_key
  one_to_many :policies, key: :source
end
