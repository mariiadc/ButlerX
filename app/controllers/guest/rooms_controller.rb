module Guest
  class RoomsController < ApplicationController

    def show
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])

      @booking = Booking.find(params[:booking_id])
       @room = Room.where(hotel_id: @booking.hotel_id)
      authorize [:guest, @booking]
      authorize [:guest, @room]
    end

  end
end

