class AddHotelToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :hotel
  end
end
