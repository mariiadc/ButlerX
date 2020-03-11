module Guest
  class CartItemsController < ApplicationController

    def index
      @cart_items = policy_scope(CartItem)
    end

    def create
      booking = Booking.find(params[:booking_id])

      @cart_item = current_user.cart.items.create!(cart_item_params)
      authorize [:guest, @cart_item]

      if cart_item_params[:cartable_type] == "Service"
        redirect_to guest_booking_services_path(booking)
      else
        redirect_to guest_booking_meals_path(booking)
      end
    end

    private

    def cart_item_params
      params.require(:cart_item).permit(:cartable_id, :cartable_type)
    end

  end
end
