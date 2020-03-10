  module Guest
  class BillsController < ApplicationController
    before_action :find, only: [:index, :show]

    def index
      @bills = policy_scope([:guest, Bill])
      @bills = Bill.where(booking_id: @booking.id)
    end

    def show
      # @room.roomservices

      authorize [:guest, @bills]
    end

    def create
      object = Service.find(params[:service_id]) if params[:service_id].present?
      object = Meal.find(params[:meal_id]) if params[:meal_id].present?
      booking = Booking.find(params[:booking_id])

      bill = object.bills.create!(sku: object.sku, amount: object.price, state: 'pending')

      authorize  [:guest, bill]

      line_items = {
        name: object.sku,
        amount: object.price_cents,
        currency: 'eur',
        quantity: 1
      }

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [line_items],
        success_url: guest_booking_bill_url(booking, bill),
        cancel_url: guest_booking_bill_url(booking, bill)
      )

      bill.update(checkout_session_id: session.id)

      if object.is_a?(Service)
        redirect_to guest_booking_services_path(booking)
      else
        redirect_to guest_booking_meals_path(booking)
      end
    end

    private

    def find
      @booking = Booking.find(params[:booking_id])

      # authorize  [:guest, @bills]
    end

    def find_service_name(sku)
      Service.find_by(service_sku: sku)
    end
  end
end

