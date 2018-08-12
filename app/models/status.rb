# frozen_string_literal: true

# application status
class Status < Sequel::Model
  unrestrict_primary_key
  one_to_many :applications, key: :app_status
end
