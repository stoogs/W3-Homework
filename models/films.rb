require_relative('../db/sql_runner')
require('pry-byebug')
class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save
    sql = "INSERT INTO films (title,price) VALUES ($1,$2) RETURNING id"
    values = [@title,@price]
    add_film = SqlRunner.run(sql,values)
    @id = add_film[0]['id'].to_i
  end

def self.all
  sql = "SELECT * FROM films"
  SqlRunner.run(sql)
end


def self.delete_all
  sql = "DELETE FROM films"
SqlRunner.run(sql)
end

def self.delete_by_id(f_id)
  sql = "DELETE FROM films WHERE id = $1"
  value = [f_id]
  SqlRunner.run(sql,value)
end

def update
  sql = " UPDATE films SET (title,price) = ($1,$2) WHERE id = $3"
  values = [@title,@price,@id]
  SqlRunner.run(sql,values)
end

def find_customer_by_film
  sql = "SELECT customers.* FROM customers
  JOIN tickets
  ON tickets.customer_id = customer_id
  WHERE film_id = $1"
  values = [@id]
  c_details = SqlRunner.run(sql,values)
  result = c_details.map {|customer| Customer.new(customer)}
  return result
end



















end # class end
