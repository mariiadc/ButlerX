class CreateRoomservices < ActiveRecord::Migration[5.2]
  def change
    create_table :roomservices do |t|
      t.references :room, foreign_key: true
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
