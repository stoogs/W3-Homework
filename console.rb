require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')
require_relative('models/screenings')

# --------- MVP Tests ---------------
# Ticket   =  @id   @customer_id   @film_id
# Film     =  @id   @title,        @price
# Customer =  @id   @name          @funds
# Screening = @id   @screening_id  @start_time   @tickets_sold @title *******************************************************************

#--------- Create/Save to DB ---------------
customer1 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
customer1.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
film1.save
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
customer2 = Customer.new("name" => "Marky Wahlberg - C2", "funds" => 2000)
customer2.save
film2 = Film.new("title" => "Boogie Nights - F2", "price" => 110)
film2.save
ticket2 = Ticket.new("customer_id" => customer2.id, "film_id" => film2.id)
ticket2.save
#********************************************************************
# ------------------  Display All
p Ticket.all
p Film.all
p Customer.all
# ------------------ Find Customer by Film & v/v
p "PRINT FILM1 BY "
result = film1.find_customer_by_film.map {|film| p film}
p "PRINT CUSTOMER1 BY FILM"
p film1.title
result = customer1.find_film_by_customer.map {|customer| p customer}
# ------------------  Delete By ID
# Customer.delete_by_id(1)
# Ticket.delete_by_id(1)
# Film.delete_by_id(1)
# # ------------------  Delete All
# Customer.delete_all
# Film.delete_all
# Ticket.delete_all
# ------------------  Customer Update DB
customer1.funds = 1337
customer1.name = "Rich Man"
customer1.update
# ------------------ Film Update DB
film1.title = "Mo-banana"
film1.price = 200
film1.update

#        ---------- EXTENSIONS------------
#------------------ TEST Customer Buy Ticket
p customer1.customer_buy_ticket(film1.price) # Can Buy
p customer1.customer_buy_ticket(film2.price) # Can't afford

#------------------ TEST Customer How Many Tickets Bought
#------------------ Customer 1 has 3 tickets
customer1 = Customer.new("name" => "Daniel Day Lewis - C2", "funds" => 100)
customer1.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
film1.save
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
ticket1.save
ticket1.save
# ------------------ Customer 2 has 2 tickets
customer2 = Customer.new("name" => "Daniel Day Lewis - C2", "funds" => 100)
customer2.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
film1.save
ticket1 = Ticket.new("customer_id" => customer2.id, "film_id" => film1.id)
ticket1.save
ticket1.save
Customer.customer_check_tickets_bought(1)
Customer.customer_check_tickets_bought(2)


#------------------ TEST How many customers are going to watch a certain film - Do Creation side.
#------------------ Customer 1 bought 2 tickets to film1
customer1 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
customer1.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
film1.save
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
ticket1.save
Film.how_many_customers_watching_film(film1.id)
# ------------------ Customer 1 bought 2 tickets to film1
customer2 = Customer.new("name" => "Daniel Day Lewis - C2", "funds" => 100)
customer2.save
ticket1 = Ticket.new("customer_id" => customer2.id, "film_id" => film1.id)
ticket1.save
ticket1.save
Film.how_many_customers_watching_film(film1.id)
Film.how_many_customers_watching_film(2)

#------------------ TEST How many customers are going to watch a certain film - PULL FROM DB
customer1 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
customer1.save
customer2 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
customer2.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
film1.save
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket2 = Ticket.new("customer_id" => customer2.id, "film_id" => film1.id)

ticket1.save
ticket1.save
ticket1.save
# ----------------- Get array of film_id's from DB. Count.
result = Ticket.all
film_id_array = result.map {|x| x["film_id"]}
by_id = film_id_array.select {|id| id == "1"}
p "There are #{by_id.length} films, id 1"
# ----------------- Add to array of film_id's from DB. Count.
ticket2.save
ticket2.save
result = Ticket.all
film_id_array = result.map {|x| x["film_id"]}
by_id = film_id_array.select {|id| id == "1"}
p "There are now #{by_id.length} films, id 1"

# ------------------ ADVANCED EXTENSIONS ------------------------
# ------------ ADD Screening * list screenings
customer1 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
customer1.save
film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 20)
film1.save
film2 = Film.new("title" => "There Will Be Blood - F2", "price" => 10)
film2.save
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
screening1 = Screening.new("screening_id" => film1.id, "start_time" => "1400", "tickets_sold" => 4, "title" => film1.title )
screening1.save
screening2 = Screening.new("screening_id" => film2.id, "start_time" => "1600", "tickets_sold" => 7, "title" => film2.title  )
screening2.save
# ------------ List screening times by film id
p screening1
screening1.film_screening_time
screening2.film_screening_time
