module Guest
  class RoomsController < ApplicationController

    def show

      @booking = Booking.find(params[:booking_id])
      authorize [:guest, @booking]
    end

  end
end

