require 'spec_helper'

describe Cart do

  it "should add 1 line item for same product" do
    expect do
      cart = Factory(:cart)
      product = Factory(:ruby)

      10.times { cart.add_product(product).save! }
    end.to change(LineItem, :count).by(1)
  end

  it "should add many line items for same product with changed price" do
    count = 10

    expect do
      cart = Factory(:cart)
      product = Factory(:ruby)

      count.times do |i|
        product.price = i + 5.99
        product.save!
        cart.add_product(product).save!
      end
    end.to change(LineItem, :count).by(count)
  end

  it "should add many line items for different products" do
    count = 10

    expect do
      cart = Factory(:cart)

      count.times { cart.add_product(Factory(:product)).save! }
    end.to change(LineItem, :count).by(count)
  end
end
