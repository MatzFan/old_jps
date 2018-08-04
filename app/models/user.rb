# frozen_string_literal: true

# a user
class User < Sequel::Model
  include BCrypt

  def password
    Password.new(password_hash)
    # @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    # @password = Password.create(new_password)
    # self.password_hash = @password
    self.password_hash = Password.create new_password
  end
end
