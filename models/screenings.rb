require_relative('../db/sql_runner')
require('pry-byebug')
class Screening
  attr_reader :id
  attr_accessor :screening_id, :start_time, :tickets_sold, :film_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @screening_id = options['screening_id'].to_i if options['screening_id']
    @start_time = options['start_time']
    @tickets_sold = options['tickets_sold'].to_i
    @film_name = options['film_name']
  end

  def save
    sql = "INSERT INTO screenings (screening_id,start_time,tickets_sold) VALUES ($1,$2,$3) RETURNING id"
    values = [@screening_id, @start_time, @tickets_sold]
    add_screening = SqlRunner.run(sql,values)
    @id = add_screening[0]['id'].to_i

# Tried to update movie name
  #   sql2 = "SELECT * FROM films
  #     WHERE id = $1"
  #   values = [@screening_id]
  #   add_film_name = SqlRunner.run(sql2,values)
  #   p add_film_name
  #   @film_name = add_film_name[0]['film_name']
  # p @film_name
   end

  def self.all
    sql = "SELECT * FROM customers"
    SqlRunner.run(sql)
  end

def film_screening_time()
sql = "SELECT screenings.* FROM screenings
WHERE screening_id = $1"
#   sql = "SELECT screenings.*, films.* FROM screenings,films
# WHERE screening_id = $1"
  values = [@screening_id]
  screening_time = SqlRunner.run(sql,values)
  p screening_time.class
  p film_times = screening_time.map {|x| x}
#
#   p film_times["start_time".to_i]
end


end # Class end
