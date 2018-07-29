# frozen_string_literal: true

# parish
class Parish < Sequel::Model
  unrestrict_primary_key
  one_to_many :parish_aliases, key: :number

  NAMES = ['Grouville', 'St. Brelade', 'St. Clement', 'St. Helier',
           'St. John', 'St. Lawrence', 'St. Martin', 'St. Mary',
           'St. Ouen', 'St. Peter', 'St. Saviour', 'Trinity'].freeze
end
