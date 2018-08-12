# frozen_string_literal: true

# application category
class Officer < Sequel::Model
  unrestrict_primary_key
  one_to_many :applications, key: :app_officer
end
