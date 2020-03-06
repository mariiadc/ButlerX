module Guest
  class EventsController < ApplicationController
    before_action :find, only: [:show]

    def index
      @events = policy_scope([:guest, Event])
      @booking = Booking.find(params[:booking_id])
      @events = Event.where(hotel_id: @booking.hotel_id)
    end


    def show
    end

  private

    def find
      @event = Event.find(params[:id])
      authorize [:guest, @event]
    end
  end
end
