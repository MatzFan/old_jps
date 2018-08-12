# frozen_string_literal: true

# policy
class Policy < Sequel::Model
  one_to_many :constraints, key: :policy_id
  many_to_one :policy_source, key: :source

  def before_create
    PolicySource.find_or_create(name: source)
    super
  end
end
