class RemoveRoomIdFromServices < ActiveRecord::Migration[5.2]
  def change
    remove_column :services, :room_id
  end
end
