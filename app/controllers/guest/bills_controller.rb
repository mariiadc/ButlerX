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

    user = current_user
    service = Service.find(params[:service_id])
    meal = Meal.find(params[:meal_id])

    @booking = Booking.find(params[:booking_id])
    @bill  = Bill.create!(service: service, service_sku: service.sku, amount: service.price, state: 'pending', user: current_user)

    authorize  [:guest, @bill]


    line_items = room.roomservice.map do |service|
      {
      name: roomservice.service.sku,
      amount: roomservice.service.price_cents,
      currency: 'eur',
      quantity: 1
    }
    end



    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [line_items],
    success_url: bill_url(order),
    cancel_url: bill_url(order)
  )

  bill.update(checkout_session_id: session.id)
  redirect_to new_bill_payment_path(order)

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

