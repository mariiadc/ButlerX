module Guest
  class ServicesController < ApplicationController
    before_action :find, only: [:show]
     def index
      @services = policy_scope([:guest, Service])
      @booking = Booking.find(params[:booking_id])
      @services = Service.where(hotel_id: @booking.hotel_id)
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])

    end

    def show
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])
      @booking = Booking.find(params[:booking_id])
      authorize [:guest, @booking]
      authorize [:guest, @service]
    end

    private

    def find
      @service = Service.find(params[:service_id])
      authorize [:guest, @service]
    end
  end
end


