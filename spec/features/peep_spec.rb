feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/create_peep')
    fill_in('peep', with: 'This is a test peep')
    click_button('Post')

    expect(page).to have_content 'This is a test peep'
  end
end