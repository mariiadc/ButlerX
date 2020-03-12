module Guest
  class MealsController < ApplicationController
    before_action :find, only: [:show]
    def index

      @meals = policy_scope([:guest, Meal])
      @booking = Booking.find(params[:booking_id])
      @meals = Meal.where(hotel_id: @booking.hotel_id)
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])
      @cart_items = CartItem.all[-1..-2]

    end

    def show
      authorize @meal
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])
    end

    def order_modal

      binding.pry
    end

    private

    def find
      @meal = Meal.find(params[:id])
      authorize @meal
    end
  end
end
