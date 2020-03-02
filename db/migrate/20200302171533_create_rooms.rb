class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.boolean :availability
      t.string :room_number, null: false
      t.references :user, foreign_key: true
    end
  end
end
