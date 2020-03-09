module Guest
  class RoomsController < ApplicationController

    def show

      @booking = Booking.find(params[:booking_id])

       @room = Room.where(hotel_id: @booking.hotel_id)
      authorize [:guest, @booking]
      authorize [:guest, @room]

    end

  end
end

