class DeleteMealskuFromBills < ActiveRecord::Migration[5.2]
  def change
    remove_column :bills, :meal_sku
  end
end
