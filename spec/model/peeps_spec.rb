require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_new_test')

    # Add the test data
    Peep.create(peep: "This is a test peep")
    Peep.create(peep: "This is a second test peep")
    Peep.create(peep: "This is a third test peep")

    peep = Peep.all

    expect(peep[0].peep).to include("This is a test peep")
    expect(peep[1].peep).to include("This is a second test peep")
    expect(peep[2].peep).to include("This is a third test peep")
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'This is a test peep')

    expect(Peep.all[0].peep).to include 'This is a test peep'
  end
end