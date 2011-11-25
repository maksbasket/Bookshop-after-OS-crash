class OrdersController < ApplicationController
  load_and_authorize_resource

  def new
    @cart = current_cart
    redirect_to store_url, :notice => 'Your cart is empty' if @cart.line_items.empty?
  end

  def create
    @order.add_line_items_from_cart current_cart
    @order.user = current_user if current_user

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      Notifier.order_received(@order).deliver
      redirect_to store_url, :notice => 'Thank you for your order'
    else
      render :action => :new
    end
  end

  def index
    @orders = @orders.paginate(:page => params[:page], :per_page => 10,
                               :order => 'created_at desc')
  end

  def ship
    if @order.ship
      Notifier.order_shipped(@order).deliver
      redirect_to order_path(@order), :notice => 'The Order marked as shipped'
    end
  end
end
