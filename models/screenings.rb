require_relative('../db/sql_runner')
require('pry-byebug')
class Screening
  attr_reader :id
  attr_accessor :screening_id, :start_time, :tickets_sold

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screening_id = options['screening_id'].to_i if options['screening_id']
    @start_time = options['start_time']
    @tickets_sold = options['tickets_sold'].to_i
  end

  def save
    sql = "INSERT INTO screenings (screening_id,start_time,tickets_sold) VALUES ($1,$2,$3) RETURNING id"
    values = [@screening_id, @start_time, @tickets_sold]
    add_screening = SqlRunner.run(sql,values)
    @id = add_screening[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM customers"
    SqlRunner.run(sql)
  end


end # Class end
