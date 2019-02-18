require 'checkout'
require 'price_calculator'
require 'item'

describe Checkout do
  let(:checkout) { Checkout.new(PriceCalculator) }

  it 'calculates discount for coca-cola' do
    checkout.add(Item.new('CC')) # +1.5
    expect(checkout.total).to eq 1.5

    checkout.add(Item.new('CC')) # +0
    expect(checkout.total).to eq 1.5

    checkout.add(Item.new('CC')) # +1.5
    expect(checkout.total).to eq 3
  end

  it 'calculates discount for pepsi' do
    checkout.add(Item.new('PC')) # +2
    expect(checkout.total).to eq 2

    checkout.add(Item.new('PC')) # +2
    expect(checkout.total).to eq 4

    checkout.add(Item.new('PC')) # = 2 * 3 * 0.8
    expect(checkout.total).to eq 4.8
  end

  it 'calculates price for water' do
    checkout.add(Item.new('WA')) # +0.85
    checkout.add(Item.new('WA')) # +0.85
    checkout.add(Item.new('WA')) # +0.85

    expect(checkout.total).to eq 0.85 * 3
  end

  it 'calculates total, applying discounts with given pricing rules' do
    checkout.add(Item.new('CC')) # 1.5
    checkout.add(Item.new('CC')) # 0

    checkout.add(Item.new('PC')) # 2 * 0.8
    checkout.add(Item.new('PC')) # 2 * 0.8
    checkout.add(Item.new('PC')) # 2 * 0.8

    checkout.add(Item.new('WA')) # 0.85

    expect("%.2f" % checkout.total).to eq '7.15'
  end
end
