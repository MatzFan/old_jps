# frozen_string_literal: true

# parish
class Parish < Sequel::Model
  unrestrict_primary_key
  one_to_many :parish_strings_parishes, key: :par_name
  many_to_many :parish_strings, left_key: :par_name, right_key: :par_string

  NAMES = ['Grouville', 'St. Brelade', 'St. Clement', 'St. Helier',
           'St. John', 'St. Lawrence', 'St. Martin', 'St. Mary',
           'St. Ouen', 'St. Peter', 'St. Saviour', 'Trinity'].freeze
end
