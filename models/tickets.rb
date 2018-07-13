require_relative('../db/sql_runner')

class Ticket
  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

def save
sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1,$2) RETURNING id"
values = [@customer_id, @film_id]
new_ticket = SqlRunner.run(sql,values)
@id = new_ticket[0]['id'].to_i
end

def self.all
  sql = "SELECT * FROM tickets"
  SqlRunner.run(sql)
end

def self.delete_all
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end

def self.delete_by_id(t_id)
  sql = "DELETE FROM tickets WHERE id = $1"
  value = [t_id]
  SqlRunner.run(sql,value)
end





















end # class end
