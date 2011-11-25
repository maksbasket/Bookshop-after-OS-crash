class StoreController < ApplicationController

  def index
    @products = Product.all
    self.counter += 1
    @counter = counter
    @cart = current_cart
  end

end
