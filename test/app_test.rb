require_relative 'test_helper'

# class UserAcceptanceTest < Minitest::Test
#   include Capybara::DSL
#   # include Capybara::Minitest::Assertions

#   # def teardown
#   #   Capybara.reset_sessions!
#   #   Capybara.use_default_driver
#   # end

#   def test_root_content
#     visit '/'
#     assert page.has_content?('Hello World!')
#   end
# end
include Capybara::DSL

describe App do
  it 'contains "Hello World!" at /' do
    visit '/'
    expect page.has_content? 'Hello World!'
  end
end
