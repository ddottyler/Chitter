# frozen_string_literal: true

require_relative '../test_helpers'

feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a peep' do
      sign_up_and_continue
      post_peep
      visit '/'
      first('.peep').click_button 'Add Comment'
      fill_in 'comment', with: 'This is a test comment on this peep'
      click_button 'Add comment'
      expect(current_path).to eq '/'
      expect(first('.peep')).to have_content 'This is a test comment on this peep'
    end
  end
end
