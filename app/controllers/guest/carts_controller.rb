module Guest
  class CartsController < ApplicationController
    before_action :set_booking
    before_action :set_cart

    def show
    if @cart.state == 'paid'
      @cart.empty!
    end
    @cart_total_price = 0
      @cart.items.each do |i|
     @cart_total_price += i.price
      end
    end

    def pay
    end

    def checkout
      line_items = @cart.items.map do |item|
        {
          name: item.sku,
          amount: item.price_cents,
          images: [ActiveStorage::Blob.service.send(:url, item.photo.key)],
          currency: 'eur',
          quantity: 1
        }
      end

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [line_items],
        success_url: root_url,
        cancel_url: guest_booking_cart_url(@booking)
      )

      @cart.update(checkout_session_id: session.id)

      redirect_to pay_guest_booking_cart_path(@booking)
    end

    private

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end

    def set_cart
      @cart = current_user.cart
      authorize [:guest, @cart]
    end
  end
end
