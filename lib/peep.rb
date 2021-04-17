require 'pg'
require_relative 'database_connection'
require_relative './comment'

class Peep

  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
      @id = id 
      @peep = peep
      @time = time 
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM chitters;')
    result.map { |peep| 
      Peep.new(
        id: peep['id'], 
        peep: peep['peep'], 
        time: peep['time']
      )}
  end

  def self.create(peep:)
    time = Time.new.strftime("%d/%m/%Y %k:%M")
    result = DatabaseConnection.query("INSERT INTO chitters (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM comments WHERE peep_id = #{id}")
    result = DatabaseConnection.query("DELETE FROM chitters WHERE id = #{id}")
  end

  def self.update(id:, peep:)
    time = Time.new.strftime("%d/%m/%Y %k:%M")
    result = DatabaseConnection.query("UPDATE chitters SET peep = '#{peep}', time = '#{time}' WHERE id = #{id} RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chitters WHERE id = #{id};")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def comments(comment_class = Comment)
    comment_class.where(peep_id: id)
  end

end