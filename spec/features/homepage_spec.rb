feature 'Viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Viewing peeps' do
  scenario 'see peeps' do
    user = create_user
    Peep.create(peep: 'This is a test peep', userid: user.id)
    Peep.create(peep: "This is a second test peep", userid: user.id)
    Peep.create(peep: "This is a third test peep", userid: user.id)

    visit '/'

    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is a second test peep"
    expect(page).to have_content "This is a third test peep"
  end
end

feature 'signing in and out options' do 
  scenario 'user can see sign in option' do 
    visit '/'
    expect(page).to have_button 'Sign in'
  end

  scenario 'user can see sign up option' do 
    visit '/'
    expect(page).to have_button 'Sign up'
  end
  
end