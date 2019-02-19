require 'bigdecimal'

require_relative 'config'

class Item
  attr_reader :code

  def initialize(code)
    @code = code.downcase.to_sym
  end

  def price
    BigDecimal.new(Config.instance[code.to_s]['price'])
  end

  def title
    Config.instance[code.to_s]['title']
  end
end
