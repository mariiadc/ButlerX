class AddColumnToRooms < ActiveRecord::Migration[5.2]
  def change
     add_reference :rooms, :booking, index: true
  end
end
