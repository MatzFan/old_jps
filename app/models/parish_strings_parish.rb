# frozen_string_literal: true

# join table
class ParishStringsParish < Sequel::Model
  many_to_one :parish, key: :par_name
  many_to_one :parish_string, key: :par_string

  def before_save
    Parish.find_or_create name: par_name
    super
  end
end
