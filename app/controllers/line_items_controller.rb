class LineItemsController < ApplicationController
  before_filter :find_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        self.counter = 0
      else
        flash[:notice] = "Can't add line item"
      end
      format.html { redirect_to(store_path) }
      format.js { @current_item = @line_item }
    end
  end

  def destroy
    line_item = @cart.line_items.find(params[:id])
    if line_item.quantity > 1
      line_item.quantity -=1
      line_item.save!
    else
      line_item.destroy
    end
    flash[:notice] = "Line item was removed"
  rescue ActiveRecord::RecordNotFound => e
    flash[:notice] = "Can't remove this line_item"
  ensure
    respond_to do |format|
      format.html { redirect_to store_path }
      format.js
    end
  end
  
  private

  def find_cart
    @cart = current_cart
  end
end
