require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')



# --------- MVP Tests ---------------
# Ticket   =  @id   @customer_id  @film_id
# Film     =  @id   @title,       @price
# Customer =  @id   @name         @funds
# *******************************************************************
# --------- Create/Save to DB ---------------
# customer1 = Customer.new("name" => "Daniel Day Lewis - C1", "funds" => 100)
# customer1.save
# film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
# film1.save
# ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
# ticket1.save
# customer2 = Customer.new("name" => "Marky Wahlberg - C2", "funds" => 2000)
# customer2.save
# film2 = Film.new("title" => "Boogie Nights - F2", "price" => 110)
# film2.save
# ticket2 = Ticket.new("customer_id" => customer2.id, "film_id" => film2.id)
# ticket2.save
# ********************************************************************
# # ------------------  Display All
# p Ticket.all
# p Film.all
# p Customer.all
# # ------------------ Find Customer by Film & v/v
# p "PRINT FILM1 BY "
# result = film1.find_customer_by_film.map {|film| p film}
# p "PRINT CUSTOMER1 BY FILM"
# p film1.title
# result = customer1.find_film_by_customer.map {|customer| p customer}
# # ------------------  Delete By ID
# Customer.delete_by_id(34)
# Ticket.delete_by_id(27)
# Film.delete_by_id(20)
# # ------------------  Delete All
# Customer.delete_all
# Film.delete_all
# Ticket.delete_all
# # ------------------  Customer Update DB
# customer1.funds = 1337
# customer1.name = "Rich Man"
# customer1.update
# # ------------------ Film Update DB
# film1.title = "Mo-banana"
# film1.price = 200
# film1.update

#         ---------- EXTENSIONS------------
# ------------------ TEST Customer Buy Ticket
# p customer1.customer_buy_ticket(film1.price) # Can Buy
# p customer1.customer_buy_ticket(film2.price) # Can't afford

# ------------------ TEST Customer How Many Tickets Bought
# ------------------ Customer 1 has 3 tickets
# customer1 = Customer.new("name" => "Daniel Day Lewis - C2", "funds" => 100)
# customer1.save
# film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
# film1.save
# ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
# ticket1.save
# ticket1.save
# ticket1.save
# # ------------------ Customer 2 has 2 tickets
# customer2 = Customer.new("name" => "Daniel Day Lewis - C2", "funds" => 100)
# customer2.save
# film1 = Film.new("title" => "There Will Be Blood - F1", "price" => 10)
# film1.save
# ticket1 = Ticket.new("customer_id" => customer2.id, "film_id" => film1.id)
# ticket1.save
# ticket1.save
# Customer.customer_check_tickets_bought(1)
# Customer.customer_check_tickets_bought(2)


# ------------------ TEST How many customers are going to watch a certain film
# ------------------ Customer 1 bought 2 tickets to film1

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
