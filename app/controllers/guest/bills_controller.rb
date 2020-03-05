module Guest
  class BillsController < ApplicationController
    before_action :find, only: [:show]

    def show
      # @room.roomservices

      authorize [:guest, @bill]
    end


    def create

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
      @bill = current_user.bills.find(params[:id])

      authorize  [:guest, @bill]
    end
  end
end

