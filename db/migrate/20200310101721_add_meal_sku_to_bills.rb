class AddMealSkuToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :meal_sku, :string
  end
end
