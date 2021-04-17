# frozen_string_literal: true

require_relative '../test_helpers'

feature 'registration' do
  scenario 'a user can sign up' do
    sign_up_and_continue

    expect(page).to have_content 'Welcome, testuser'
  end
end
