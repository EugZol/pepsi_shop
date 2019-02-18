PriceCalculator = {
  cc: ->(basket_part) {
    price_of_one = basket_part.first.price
    (basket_part.length / 2.0).ceil * price_of_one
  },
  pc: ->(basket_part) {
    price = basket_part.sum(&:price)

    if basket_part.length >= 3
      price * 0.8
    else
      price
    end
  },
  wa: ->(basket_part) {
    basket_part.sum(&:price)
  }
}
