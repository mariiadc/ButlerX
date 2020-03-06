module Guest
  class ServicesController < ApplicationController
    before_action :find, only: [:show]
     def index
      @services = policy_scope([:guest, Service])
      @booking = Booking.find(params[:booking_id])
      @services = Service.where(hotel_id: @booking.hotel_id)
    end

    def show
      authorize [:guest, @service]
    end

    private

    def find
      @service = Service.find(params[:id])
      authorize [:guest, @service]
    end
  end
end


