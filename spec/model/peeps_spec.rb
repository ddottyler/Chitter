# frozen_string_literal: true

require 'peep'

describe Peep do
  let(:comment_class) { double(:comment_class) }

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_new_test')

      # Add the test data
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      Peep.create(peep: 'This is a second test peep', userid: user.id)
      Peep.create(peep: 'This is a third test peep', userid: user.id)

      peep = Peep.all

      expect(peep[0].peep).to include('This is a test peep')
      expect(peep[1].peep).to include('This is a second test peep')
      expect(peep[2].peep).to include('This is a third test peep')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)

      persisted_data = persisted_data(id: Peep.all[0].id, table: 'chitters')

      expect(Peep.all[0].peep).to include 'This is a test peep'
    end
  end

  describe '.delete' do
    it 'deletes the given peep' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      peeps = Peep.all
      Peep.delete(id: peeps[0].id)
      expect(Peep.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the peep with the given data' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      peeps = Peep.all
      updated_peep = Peep.update(id: peeps[0].id, peep: 'This is an updated test peep')

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peeps[0].id
      expect(updated_peep.peep).to eq 'This is an updated test peep'
    end
  end

  describe '.find' do
    it 'returns the requested peep object' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      peeps = Peep.all
      peep = peeps[0]
      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peeps[0].id
      expect(result.peep).to eq 'This is a test peep'
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      user = create_user
      Peep.create(peep: 'This is a test peep', userid: user.id)
      expect(comment_class).to receive(:where).with(peep_id: Peep.all[0].id)

      Peep.all[0].comments(comment_class)
    end
  end
end
