# frozen_string_literal: true

require 'comment'
require 'peep'
require 'database_helpers'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      peeps = Peep.all
      comment = Comment.create(text: 'This is a test comment', peep_id: peeps[0].id)

      persisted_data = persisted_data(id: comment.id, table: 'comments')

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.peep_id).to eq peeps[0].id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the databse' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      peeps = Peep.all
      Comment.create(text: 'This is a test comment', peep_id: peeps[0].id)
      Comment.create(text: 'This is a second test comment', peep_id: peeps[0].id)

      comments = Comment.where(peep_id: peeps[0].id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a test comment'
      expect(comment.peep_id).to eq peeps[0].id
    end
  end
end
