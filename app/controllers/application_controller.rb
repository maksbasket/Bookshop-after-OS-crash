class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied, ActiveRecord::RecordNotFound do |e|
    flash[:alert] = "Access denied."
    redirect_to root_url
    Notifier.failure(e, 'ApplicationController').deliver
  end


  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound => e
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  protected
  
  def counter
    session[:counter] || 0
  end
  
  def counter=(count)
    session[:counter] = count
  end
end
