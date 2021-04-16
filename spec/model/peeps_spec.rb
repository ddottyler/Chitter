require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_new_test')

    # Add the test data
    Peep.create(peep: "This is a test peep")
    Peep.create(peep: "This is a second test peep")
    Peep.create(peep: "This is a third test peep")

    peep = Peep.all

    expect(peep).to include("This is a test peep")
    expect(peep).to include("This is a second test peep")
    expect(peep).to include("This is a third test peep")
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'This is a test peep')

    expect(Peep.all).to include 'This is a test peep'
  end
end