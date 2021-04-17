require_relative  '../test_helpers.rb'
feature 'Deleting a peep' do
  scenario 'A user can delete a peep' do
    user = create_user
    Peep.create(peep: 'This is a test peep', userid: user.id)
    visit('/')
    expect(page).to have_content('This is a test peep')

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content('This is a test peep')
  end
end