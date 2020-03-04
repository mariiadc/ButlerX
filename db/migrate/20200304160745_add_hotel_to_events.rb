class AddHotelToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :hotel
  end
end
