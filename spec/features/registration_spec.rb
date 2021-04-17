feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('username', with: 'testuser')
    click_button('Sign up')

    expect(page).to have_content "Welcome, testuser"
  end
end