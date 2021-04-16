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

feature 'Viewing peeps' do
  scenario 'see peeps' do
    Peep.create(peep: "This is a test peep")
    Peep.create(peep: "This is a second test peep")
    Peep.create(peep: "This is a third test peep")

    visit '/'

    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is a second test peep"
    expect(page).to have_content "This is a third test peep"
  end
end