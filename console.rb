require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

film1 = Film.new("title" => "Dumb & Dumber", "price" => 10)
p film1
film1.save

customer1 = Customer.new("name" => "Jermaine", "funds" => 100)
p customer1
customer1.save()

# ticket1 = Ticket.new
