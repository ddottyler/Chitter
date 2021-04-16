feature 'Viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end

  scenario 'a user can see a add peep button' do 
    visit('/')
    expect(page).to have_button "Add Peep"
  end
end