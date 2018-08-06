# frozen_string_literal: true

require_relative 'feature_test_helper'

class ContactPageTest < CapybaraTestCase
  def teardown
    super
    Mail::TestMailer.deliveries.clear
  end

  def test_contact_form
    visit '/contact'
    fill_in 'name', with: 'Joe'
    fill_in 'email', with: 'joe@mail.com'
    fill_in 'message', with: 'Msg'
    click_button 'Send'
    assert_equal 1, Mail::TestMailer.deliveries.length
    assert_equal 'Message sent!', page.find('.alert').text
  end
end
