class Checkout
  def initialize(pricing_rules)
    @basket = {}
    @pricing_rules = pricing_rules
  end

  def add(item)
    @basket[item.code] ||= []
    @basket[item.code] << item
  end

  def total
    @basket.inject(0) do |sum, (kind, basket_part)|
      sum + @pricing_rules[kind].(basket_part)
    end
  end
end
