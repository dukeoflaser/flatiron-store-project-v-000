class LineItemsController < ApplicationController

  def create
    if current_user.current_cart.nil?
      current_user.current_cart = Cart.new
    end

    current_cart = current_user.current_cart
    line_item = current_cart.add_item(params[:item_id])

    current_cart.line_items << line_item
    redirect_to cart_path(current_cart)
  end

end
