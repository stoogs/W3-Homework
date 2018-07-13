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
