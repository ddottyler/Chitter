require 'pg'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
      @id = id 
      @peep = peep
      @time = time 
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_new_test')
    else
      connection = PG.connect(dbname: 'chitter_new')
    end
    result = connection.exec('SELECT * FROM chitters;')
    result.map { |peep| 
      Peep.new(
        id: peep['id'], 
        peep: peep['peep'], 
        time: peep['time']
      )}
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_new_test')
  else 
      connection = PG.connect(dbname: 'chitter_new')
  end
    time = Time.new.strftime("%d/%m/%Y %k:%M")
    result = connection.exec("INSERT INTO chitters (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

end