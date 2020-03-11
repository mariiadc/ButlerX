module Guest
  class CartItemsController < ApplicationController

    def index
      @cart_items = policy_scope(CartItem)
    end

    def create
      booking = Booking.find(params[:booking_id])

      object = Service.find(params[:service_id]) if params[:service_id].present?
      object = Meal.find(params[:meal_id]) if params[:meal_id].present?

      @cart_item = current_user.cart.items.create!(cartable: object)

      if object.is_a?(Service)
        redirect_to guest_booking_services_path(booking)
      else
        redirect_to guest_booking_meals_path(booking)
      end
    end

  end
end
