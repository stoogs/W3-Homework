require_relative('../db/sql_runner')

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ($1,$2) RETURNING id"
    values = [@name, @funds]
    add_customer = SqlRunner.run(sql,values)
    @id = add_customer[0]['id'].to_i
  end

def self.all
  sql = "SELECT * FROM customers"
  SqlRunner.run(sql)
end


def self.delete_all
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

def self.delete_by_id(c_id)
  sql = "DELETE FROM customers WHERE id = $1"
  value = [c_id]
  SqlRunner.run(sql,value)
end


def update
  sql = "UPDATE customers SET (name,funds) = ($1,$2) WHERE id = $3"
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)

end

def find_film_by_customer
  sql = "SELECT films.* FROM films
  JOIN tickets
  ON tickets.film_id = film_id
  WHERE customer_id = $1"
  values = [@id]
  f_details = SqlRunner.run(sql,values)
  result = f_details.map {|film| Film.new(film)}
  return result
end



















end #class end
