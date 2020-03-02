class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
    end
  end
end
