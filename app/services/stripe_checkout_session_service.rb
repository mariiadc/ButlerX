class StripeCheckoutSessionService
  def call(event)
    bill = Bill.find_by(checkout_session_id: event.data.object.id)
    bill.update(state: 'paid')
  end
end
