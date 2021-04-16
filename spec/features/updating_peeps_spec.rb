feature 'Updating a peep' do
  scenario 'A user can update a peep' do
    Peep.create(peep: 'This is a test peep')
    peeps = Peep.all
    visit('/')
    expect(page).to have_content 'This is a test peep'

    first('.peep').click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peeps[0].id}/edit"

    fill_in('peep', with: "This peep has been updated")
    click_button('Edit')

    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is a test peep')
    expect(page).to have_content("This peep has been updated")
  end
end