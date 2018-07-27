require_relative 'test_helper'

describe App do
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  it 'contains "Hello World!" at /' do
    visit '/'
    expect page.has_content? 'Hello World!'
  end
end
