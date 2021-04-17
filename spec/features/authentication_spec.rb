# frozen_string_literal: true

require_relative '../test_helpers'

feature 'authentication' do
  it 'a user can sign in' do
    create_user
    sign_in
    expect(page).to have_content 'Welcome, testuser'
  end

  scenario 'a user sees an error if they get their email wrong' do
    create_user

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their password wrong' do
    create_user

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
  end

  scenario 'a user can sign out' do
    create_user
    sign_in
    click_button('Sign out')
    expect(page).not_to have_content 'Welcome, test@example.com'
  end
end
