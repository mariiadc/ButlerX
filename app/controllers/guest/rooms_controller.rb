module Guest
  class RoomsController < ApplicationController

    def show
      @chat_room = ChatRoom.find_by(booking_id: params[:booking_id])

      @booking = Booking.find(params[:booking_id])
       @room = Room.where(hotel_id: @booking.hotel_id)
      authorize [:guest, @booking]
      authorize [:guest, @room]
    end

    def key
      @booking = Booking.find(params[:booking_id])
      @room = Room.find(@booking.room_id)
      @key = @room.key

      @qr = RQRCode::QRCode.new(@key)
      # @svg = qrcode.as_svg(
      #   offset: 0,
      #   color: '000',
      #   shape_rendering: 'crispEdges',
      #   module_size: 6,
      #   standalone: true
      # )
      authorize [:guest, @room]
    end

  end
end

