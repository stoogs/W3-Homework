require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

film1 = Film.new("title" => "Dumb & Dumber", "price" => 10)
p film1
film1.save


customer1 = Customer.new("name" => "Jermaine", "funds" => 100)
p customer1
customer1.save()

  #@id @customer_id @film_id
ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
p ticket1

p Ticket.all
p Film.all
p Customer.all





ticket1 = Ticket.new("customer_id" => customer1.id, "film_id" => film1.id)
ticket1.save
customer1 = Customer.new("name" => "Jermaine", "funds" => 100)
customer1.save
film1 = Film.new("title" => "Dumb & Dumber", "price" => 10)
film1.save

# Film.delete_all
# Ticket.delete_all
Customer.delete_by_id(19)
Ticket.delete_by_id(27)
Film.delete_by_id(20)
