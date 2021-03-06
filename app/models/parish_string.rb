# frozen_string_literal: true

# parish string e.g. 'St. Helier/St. Lawrence'
class ParishString < Sequel::Model
  unrestrict_primary_key
  one_to_many :parish_strings_parishes, key: :par_string
  many_to_many :parishes, left_key: :par_string, right_key: :par_name

  def after_save
    populate_join_table
    super
  end

  WORDS = %w[Grouville Brelade Clement Helier John Lawrence
             Martin Mary Ouen Peter Saviour Trinity].freeze

  private

  def populate_join_table
    parish_names.each do |name|
      ParishStringsParish.find_or_create par_name: name, par_string: string
    end
  end

  def parish_names
    Parish::NAMES.each_with_index.map do |parish, i|
      string.include?(WORDS[i]) ? parish : nil
    end.compact
  end
end
