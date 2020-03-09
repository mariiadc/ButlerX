module Guest
  class ChatRoomsController < ApplicationController
    def show
      @chat_room = ChatRoom.find(params[:id])
      #@chat_room = ChatRoom.includes(messages: :user).find(params[:id])
      @booking = Booking.find(params[:booking_id])
      authorize @chat_room
    end
  end
end
