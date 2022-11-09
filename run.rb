require './application_model.rb'
require './item.rb'
require './order.rb'


o1 = Order.new("10","1 book at 12.49","1 music CD at 14.99","1 chocolate bar at 0.85")
o1.print_receipt

o2 = Order.new("11","1 imported box of chocolates at 10.00","1 imported bottle of perfume at 47.50")
o2.print_receipt

o3 = Order.new("12","1 imported bottle of perfume at 27.99","1 bottle of perfume at 18.99","1 packet of headache pills at 9.75","1 box of imported chocolates at 11.25")
o3.print_receipt

o1.get_items("book")
