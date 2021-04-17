# frozen_string_literal: true

require_relative  '../test_helpers'

feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    sign_up_and_continue
    visit('/create_peep')
    fill_in('peep', with: 'This is a test peep')
    click_button('Post')

    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'User: testuser'
  end
end
