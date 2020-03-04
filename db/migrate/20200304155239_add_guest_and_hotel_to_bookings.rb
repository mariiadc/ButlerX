class AddGuestAndHotelToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :guest
    add_reference :bookings, :hotel
  end
end
