feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a peep' do
      Peep.create(peep: 'This is a test peep')
      peeps = Peep.all

      visit '/'
      first('.peep').click_button 'Add Comment'

      expect(current_path).to eq "/peeps/#{peeps[0].id}/comments/new"

      fill_in 'comment', with: 'This is a test comment on this peep'
      click_button 'Add comment'

      expect(current_path).to eq '/'
      expect(first('.peep')).to have_content 'This is a test comment on this peep'
    end
  end
end