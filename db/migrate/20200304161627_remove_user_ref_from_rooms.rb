class RemoveUserRefFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :user, foreign_key: true
  end
end
