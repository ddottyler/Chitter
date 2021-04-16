require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_new_test')
    else
      connection = PG.connect(dbname: 'chitter_new')
    end
    peeps = connection.exec('SELECT * FROM chitters;')
    peeps.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_new_test')
    else
      connection = PG.connect(dbname: 'chitter_new')
    end

    connection.exec("INSERT INTO chitters (peep) VALUES('#{peep}')")
  end

end