# frozen_string_literal: true

def sign_up_and_continue
  visit '/'
  click_link 'Sign up'
  fill_in('email', with: 'my_email@email.com')
  fill_in('password', with: 'password123')
  fill_in('username', with: 'testuser')
  click_button 'Sign up'
end

def sign_in
  create_user
  visit '/'
  click_link 'Sign in'
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button 'Sign in'
end

def create_user
  User.create(email: 'test@example.com', password: 'password123', username: 'testuser')
end
