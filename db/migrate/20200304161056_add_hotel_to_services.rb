class AddHotelToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :hotel
  end
end
