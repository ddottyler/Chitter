# frozen_string_literal: true

feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    sign_up_and_continue
    post_peep
    visit '/'
    visit('/')
    expect(page).to have_content 'This is a test peep'

    first('.peep').click_button 'Edit'

    fill_in('peep', with: 'This peep has been updated')
    click_button('Edit')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is a test peep')
    expect(page).to have_content('This peep has been updated')
  end
end
