require 'pg'
require_relative 'database_connection'
require_relative './comment'

class Peep

  attr_reader :id, :peep, :time, :userid

  def initialize(id:, peep:, time:, userid:)
      @id = id 
      @peep = peep
      @time = time 
      @userid = userid
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM chitters;')
    result.map { |peep| 
      Peep.new(
        id: peep['id'], 
        peep: peep['peep'], 
        time: peep['time'],
        userid: peep['userid']
      )}
  end

  def self.create(peep:, userid:)
    time = Time.new.strftime("%d/%m/%Y %k:%M")
    result = DatabaseConnection.query("INSERT INTO chitters (peep, time, userid) VALUES('#{peep}', '#{time}', '#{userid}') RETURNING id, peep, time, userid;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], userid: peep['userid'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM comments WHERE peep_id = #{id}")
    result = DatabaseConnection.query("DELETE FROM chitters WHERE id = #{id}")
  end

  def self.update(id:, peep:)
    time = Time.new.strftime("%d/%m/%Y %k:%M")
    result = DatabaseConnection.query("UPDATE chitters SET peep = '#{peep}', time = '#{time}' WHERE id = #{id} RETURNING id, peep, time, userid;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], userid: peep['userid'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chitters WHERE id = #{id};")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], userid: result['userid'.to_i])
  end

  def comments(comment_class = Comment)
    comment_class.where(peep_id: id)
  end

end