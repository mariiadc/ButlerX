class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.boolean :status
      t.references :user, foreign_key: true
    end
  end
end
