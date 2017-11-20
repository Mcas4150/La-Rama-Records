class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]

  def create
    @cart.add_product(params)

    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'

  end
end
