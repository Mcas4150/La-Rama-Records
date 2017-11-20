class ApplicationController < ActionController::Base
  respond_to :html, :js
  protect_from_forgery with: :exception
 before_filter do
    @discogs = Discogs::Wrapper.new("La Rama", user_token: "tJTZwyDlsmmQCxOjBBhNygEucUsbKELlYfTzsZYp")
  end
  # before_action :set_cart

  # private
  #   def set_cart
  #     @cart = Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #     @cart = Cart.create
  #     session[:cart_id] = @cart.id
  #   end



end
