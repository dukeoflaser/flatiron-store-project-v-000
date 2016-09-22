class CartsController < ApplicationController
  def show
    @current_cart = Cart.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.update_inventory
    @cart.update(status: "submitted")
    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end
end
