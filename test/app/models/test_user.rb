# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../app/models/user'

class UserTest < JpsTest
  def setup
    super
    User.create(name: 'Joe', email: 'joe@mail.com', password: 'pass')
    @user = User.first
  end

  def test_save
    assert @user
  end

  def test_email_must_be_unique
    u2 = User.new(User.first.values.merge(name: 'J').tap { |h| h.delete(:id) })
    assert_raises(Sequel::UniqueConstraintViolation) { u2.save }
  end

  def test_password_digest
    assert_equal 60, @user.password_hash.size # bcrypt hash
  end
end
