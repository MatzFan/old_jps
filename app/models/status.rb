# frozen_string_literal: true

# planning_app status
class Status < Sequel::Model
  unrestrict_primary_key
  one_to_many :planning_apps, key: :app_status
end
