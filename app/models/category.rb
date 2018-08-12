# frozen_string_literal: true

# application category
class Category < Sequel::Model
  unrestrict_primary_key
  one_to_many :applications, key: :app_category
end
