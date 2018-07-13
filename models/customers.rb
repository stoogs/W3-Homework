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























end #class end
