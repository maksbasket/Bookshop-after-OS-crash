class CartsController < ApplicationController

  def destroy
    current_cart.destroy
    session[:cart_id] = nil
    
    respond_to do |format|
      format.html { redirect_to root_path, 
                                :notice => 'Your cart is currently empty' }
      format.js
    end
  end
end
