class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price
      t.references :service, foreign_key: true

    end
  end
end
