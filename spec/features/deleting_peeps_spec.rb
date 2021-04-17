# frozen_string_literal: true

require_relative  '../test_helpers'
feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    sign_up_and_continue
    post_peep
    visit '/'
    visit('/')
    expect(page).to have_content('This is a test peep')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is a test peep')
  end
end
