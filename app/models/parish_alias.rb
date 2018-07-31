# frozen_string_literal: true

# parishes can have multiple aliases
class ParishAlias < Sequel::Model
  unrestrict_primary_key
  one_to_many :planning_apps, key: :app_parish
  many_to_one :parish, key: :parish_num

  def before_save
    parish = Parish.where(name: name).first # may be nil
    self.parish_num = parish.number if parish
    super
  end
end
