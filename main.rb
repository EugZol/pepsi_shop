require_relative 'lib/item'
require_relative 'lib/checkout'
require_relative 'lib/price_calculator'

checkout = Checkout.new(PriceCalculator)

checkout.add(Item.new('CC')) # 1.5
checkout.add(Item.new('CC')) # 0

checkout.add(Item.new('PC')) # 2 * 0.8
checkout.add(Item.new('PC')) # 2 * 0.8
checkout.add(Item.new('PC')) # 2 * 0.8

checkout.add(Item.new('WA')) # 0.85

puts "%.2f" % checkout.total # 7.15
